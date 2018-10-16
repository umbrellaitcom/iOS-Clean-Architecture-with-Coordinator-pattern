//
//  RequestManager.swift
//  Worker Dashy
//
//  Created by Umbrella tech on 23.08.17.
//  Copyright © 2017 Umbrella. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper
import ObjectMapper

public typealias Parameters = [String : Any]
public typealias Headers = [String : String]
public typealias Failure = (NSError) -> Void
public typealias Success<T> = (T) -> Void
public typealias SuccessNoMapping = Success<[String : Any]?>
public typealias ResponseHeaders = Success<Headers>

open class RequestManager {
    
    open static let shared: RequestManager = {
        return RequestManager()
    }()
    
    open static func setup(configuration: RequestManagerConfiguration) {
        RequestManager.shared.setup(configuration: configuration)
    }
    
    open func setup(configuration: RequestManagerConfiguration) {
        requestManagerConfigure(configuration)
    }
    
    open var configuration: RequestManagerConfiguration {
        return _configuration
    }
    
    // MARK: - Private methods
    fileprivate var requestManager: SessionManager!
    
    private func requestManagerConfigure(_ configuration: RequestManagerConfiguration) {
        self._configuration = configuration
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = configuration.timeout
        config.timeoutIntervalForResource = configuration.timeout
        self.requestManager = SessionManager(configuration: config)
    }
    
    private init() {}
    
    public init(configuration: RequestManagerConfiguration) {
        requestManagerConfigure(configuration)
    }
    
    fileprivate var _configuration: RequestManagerConfiguration!
    
    fileprivate func configure(parameters: Parameters?) -> Parameters {
        var params: Parameters = _configuration.defaultParams ?? [:]
        
        if let parameters = parameters {
            params += parameters
        }
        
        return params
    }
    
    fileprivate func configure(headers: Headers?) -> Headers? {
        var _headers: Headers = _configuration.defaultHeaders ?? [:]
        if let headers = headers {
            _headers += headers
        }
        return _headers
    }
    
    public func prepareRequest(
        URL: String,
        method: HTTPMethod,
        parameters: Parameters?,
        headers: Headers?,
        encoding: ParameterEncoding?) -> DataRequest
    {
        let fullUrl = _configuration.baseURL + URL
        let headers: Headers? = configure(headers: headers)
        let params:  Parameters? = configure(parameters: parameters)
        let request: DataRequest = requestManager.request(fullUrl, method: method, parameters: params, encoding: encoding ?? _configuration.encoding,
                                                          headers: headers)
        if _configuration.logging {
            print("🚀Request: \r \(request.debugDescription)")
        }
        return request
    }
    
    fileprivate func log<T>(_ response: DataResponse<T>) {
        if _configuration.logging {
            print("📥Response: \r \(response.response.debugDescription)")
            if let jsonString = jsonString(fromData: response.data!) {
                print("JSON: \(jsonString)")
            } else {
                print("🔥⚠️🔥JSON: No data")
            }
        }
    }
    
    fileprivate func jsonString(fromData: Data) -> String? {
        return String(data: fromData, encoding: String.Encoding.utf8)
    }
    
    public func handleError<T>(_ response: DataResponse<T>) -> NSError? {
        let result: [String : Any]? = response.toJSON()
        if let resultValue = result {
            if
                let JSONToMap = resultValue["error"],
                let error: RequestManagerErroring = _configuration.errorMap?(JSONToMap) {
                let serverError = error.errorCode
                if let serverErrorString = error.description {
                    return .error(title: serverErrorString, code: serverError)
                }
            }
            else if
                let code = result?["code"] as? Int,
                let message = result?["message"] as? String {
                return .error(title: message, code: code)
                
            }
        } else {
            if let _ = response.result.error {
                if response.response?.statusCode != nil {
                    if let handler = _configuration.httpErrorHandler {
                        handler(response.response?.statusCode)
                    }
                    else {
                        return _configuration.undefinedError
                    }
                }
                else {
                    return _configuration.nilResponseError
                }
            }
        }
        return nil
    }
    
    // MARK: - Public methods
    
    open func makeRequestWithoutMapping(
        URL: String,
        method: HTTPMethod = .post,
        encoding: ParameterEncoding? = nil,
        parameters: Parameters? = nil,
        headers: Headers? = nil,
        failure: @escaping Failure,
        success: @escaping Success<Any>) {
        let request: DataRequest = prepareRequest(URL: URL,
                                                  method: method,
                                                  parameters: parameters,
                                                  headers: headers,
                                                  encoding: encoding)
        request.responseJSON { [weak self] (response) in
            guard let strongSelf = self else {
                return
            }
            strongSelf.log(response)
            let error = strongSelf.handleError(response)
            
            if let error = error {
                failure(error)
            } else {
                if let response = response.result.value {
                    success(response)
                }
                else {
                    failure(strongSelf.configuration.nilResponseError)
                }
            }
        }
    }
    
    open func makeRequestObject<T: BaseMappable>(
        URL: String,
        method: HTTPMethod = .post,
        encoding: ParameterEncoding? = nil,
        parameters: Parameters? = nil,
        headers: Headers? = nil,
        keyPath: String,
        failure: @escaping Failure,
        success: @escaping Success<T>,
        successNoMapping: SuccessNoMapping? = nil,
        successHeaders: ResponseHeaders? = nil) {
        let request: DataRequest = prepareRequest(URL: URL,
                                                  method: method,
                                                  parameters: parameters,
                                                  headers: headers,
                                                  encoding: encoding)
        request.responseObject(queue: nil, keyPath: keyPath, mapToObject: nil, context: nil) { [weak self] (response: DataResponse<T>) in
            guard let strongSelf = self else {
                return
            }
            strongSelf.log(response)
            let error = strongSelf.handleError(response)
            
            if let error = error {
                failure(error)
            } else {
                if let response = response.result.value {
                    success(response)
                }
                else {
                    failure(strongSelf.configuration.nilResponseError)
                }
                
                if let noMapping = successNoMapping {
                    if let result = response.toJSON() {
                        noMapping(result)
                    } else {
                        noMapping(nil)
                    }
                }
                
                if let responseHeaders = successHeaders {
                    responseHeaders(response.response?.allHeaderFields as! Headers)
                }
            }
        }
    }
    
    open func makeRequest<T: BaseMappable>(
        URL: String,
        method: HTTPMethod = .post,
        encoding: ParameterEncoding? = nil,
        parameters: Parameters? = nil,
        headers: Headers? = nil,
        keyPath: String,
        failure: @escaping Failure,
        success: @escaping Success<[T]>,
        successNoMapping: SuccessNoMapping? = nil) {
        let request: DataRequest = prepareRequest(URL: URL,
                                                  method: method,
                                                  parameters: parameters,
                                                  headers: headers,
                                                  encoding: encoding)
        request.responseArray(queue: nil, keyPath: keyPath, context: nil) { [weak self] (response: DataResponse<[T]>) in
            guard let strongSelf = self else {
                return
            }
            strongSelf.log(response)
            let error = strongSelf.handleError(response)
            
            if let error = error {
                failure(error)
            } else {
                if let response = response.result.value {
                    success(response)
                }
                else {
                    failure(strongSelf.configuration.nilResponseError)
                }
                
                if let noMapping = successNoMapping {
                    if let result = response.toJSON() {
                        noMapping(result)
                    } else {
                        noMapping(nil)
                    }
                }
            }
        }
    }
}

func += <KeyType, ValueType> (left: inout Dictionary<KeyType, ValueType>, right: Dictionary<KeyType, ValueType>) {
    for (k, v) in right {
        left.updateValue(v, forKey: k)
    }
}

extension DataResponse {
    func toJSON() -> [String : Any]? {
        let JSONSerializer = DataRequest.jsonResponseSerializer(options: JSONSerialization.ReadingOptions.allowFragments)
        let resultDict = JSONSerializer.serializeResponse(self.request, self.response, self.data, nil)
        return resultDict.value as? [String : Any]
    }
}
