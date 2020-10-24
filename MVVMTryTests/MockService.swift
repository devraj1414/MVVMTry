//
//  MockService.swift
//  MVVMTryTests
//
//  Created by Suruchi Kumari on 24/10/20.
//  Copyright © 2020 Suruchi Kumari. All rights reserved.
//

import Foundation
@testable import MVVMTry

class MockService:  DataServiceProtocol{

    var albums : [Album] = []
    var isAlbumsServiceInvoked = false
    var fetchError : FetchError?
    var onCompletion : ((Result<[Album], FetchError>)->())!
    var albumsUrl : URL?
     func fetch<T:Decodable>(url: URL, completion: @escaping (Result<T, FetchError>) -> ()) {
        albumsUrl = url
        isAlbumsServiceInvoked = true
        typealias T = [Album]
        if let comple = completion as? ((Result<[Album], FetchError>)->()){
            onCompletion = comple
        }
    }
    
    func onSuccess(){
        return onCompletion(.success(albums))
    }
    func onFailure(error : FetchError){
        return onCompletion(.failure(error))
    }
    
    
}
