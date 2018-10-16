//
//  GoogleMapsRequestWrapper.swift
//  Worker Dashy
//
//  Created by Umbrella tech on 23.08.17.
//  Copyright © 2017 Umbrella. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

public class RequestWrapper {
    
    let requestManager: RequestManager
    
    init(with configuration: RequestManagerConfiguration) {
        requestManager = RequestManager(configuration: configuration)
    }
    
    open func makeRequestWithoutMapping(
        URL: String,
        method: HTTPMethod = .post,
        encoding: ParameterEncoding? = nil,
        parameters: Parameters? = nil,
        headers: Headers? = nil,
        failure: @escaping Failure,
        success: @escaping Success<Any>)
    {
        requestManager.makeRequestWithoutMapping(URL: URL,
                                                 method: method,
                                                 encoding: encoding,
                                                 parameters: parameters,
                                                 headers: configureHeaders(headers),
                                                 failure: failure,
                                                 success: success)
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
        responseHeaders: ResponseHeaders? = nil)
    {
        requestManager.makeRequestObject(URL: URL,
                                         method: method,
                                         encoding: encoding,
                                         parameters: parameters,
                                         headers: configureHeaders(headers),
                                         keyPath: keyPath,
                                         failure: failure,
                                         success: success,
                                         successNoMapping: successNoMapping,
                                         successHeaders: responseHeaders)
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
        successNoMapping: SuccessNoMapping? = nil)
    {
        requestManager.makeRequest(URL: URL,
                                   method: method,
                                   encoding: encoding,
                                   parameters: parameters,
                                   headers: configureHeaders(headers),
                                   keyPath: keyPath,
                                   failure: failure,
                                   success: success)
    }
}

extension RequestWrapper {
    func configureHeaders(_ headers: Headers? = nil) -> Headers {
        var _headers: Headers = [:]
        if let headers = headers {
            _headers += headers
        }
        return _headers
    }
}
