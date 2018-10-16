//
//  MainRequestManager.swift
//  CleanArchitectureWithCoordinatorPatternDemo
//
//  Created by Umbrella tech on 11.11.2017.
//  Copyright © 2017 Umbrella. All rights reserved.
//

import Foundation

final class MainRequestManager {
    
    let mainRequestManager: RequestWrapper
    
    let configuration = RequestManagerConfiguration(baseURL : Urls.base,
                                                    params  : ["ts"     : Urls.timestamp,
                                                               "apikey" : ApiKeys.publicKey,
                                                               "hash"   : MainRequestManager.hash],
                                                    timeout : 20,
                                                    logging : true)
    
    fileprivate static var hash: String! {
        return makeHash(Urls.timestamp, publicKey: ApiKeys.publicKey, privateKey: ApiKeys.privateKey)
    }
    
    fileprivate static func makeHash(_ timestamp : NSNumber, publicKey : String, privateKey : String) -> String {
        return "\(timestamp)\(privateKey)\(publicKey)".md5()
    }
    
    init() {
        mainRequestManager = RequestWrapper(with: configuration)
    }
    
    func getCharacters(offset  : Int,
                       count   : Int,
                       failure : @escaping Failure,
                       success : @escaping Success<[Character]>) {
        mainRequestManager.makeRequest(URL     : Urls.Endpoints.characters,
                                       method  : .get,
                                       keyPath : "data.results",
                                       failure : failure,
                                       success : success)
    }
}
