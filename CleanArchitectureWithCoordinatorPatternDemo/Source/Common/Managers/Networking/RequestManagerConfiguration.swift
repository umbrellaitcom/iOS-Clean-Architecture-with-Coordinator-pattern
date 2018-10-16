//
//  RequestManagerConfiguration.swift
//  Worker Dashy
//
//  Created by Umbrella tech on 23.08.17.
//  Copyright © 2017 Umbrella. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire

public typealias ErrorMapping = (Any) -> (RequestManagerErroring?)
public typealias HttpErrorHandler = (Int?) -> Void

public struct RequestManagerConfiguration {
    public var baseURL: String
    
    public var defaultParams    : Parameters?
    public var defaultHeaders   : Headers?
    public var timeout          : TimeInterval = 10
    public var logging          : Bool         = false
    public var errorMap         : ErrorMapping?
    public var undefinedError   : NSError
    public var nilResponseError : NSError
    public var encoding         : ParameterEncoding
    public var httpErrorHandler : HttpErrorHandler?
    
    public init(baseURL          : String,
                params           : Parameters?        = nil,
                headers          : Headers?           = nil,
                timeout          : TimeInterval       = 10,
                encoding         : ParameterEncoding  = URLEncoding.default,
                logging          : Bool               = false,
                nilResponseError : NSError            = .error(title : "Check your internet connection", code : -11),
                undefinedError   : NSError            = .error(title   : "Sorry, but something went wrong", code   : -1),
                httpErrorHanlder : HttpErrorHandler?  = nil,
                errorMap         : ErrorMapping?      = nil)
    {
        self.baseURL          = baseURL
        self.defaultParams    = params
        self.defaultHeaders   = headers
        self.timeout          = timeout
        self.encoding         = encoding
        self.logging          = logging
        self.undefinedError   = undefinedError
        self.nilResponseError = nilResponseError
        self.errorMap         = errorMap
        self.httpErrorHandler = httpErrorHanlder
    }
}
