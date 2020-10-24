//
//  DataService.swift
//  MVVMTry
//
//  Created by Suruchi Kumari on 24/10/20.
//  Copyright © 2020 Suruchi Kumari. All rights reserved.
//

import Foundation


protocol DataServiceProtocol {
    func fetch<T:Decodable>(url : URL, completion : @escaping (Result<T, FetchError>)->())
}

enum FetchError : Error{
    case NetworkError
    case ParsingError
}
class DataService : DataServiceProtocol{
  
    
    func fetch<T:Decodable>(url: URL, completion: @escaping (Result<T, FetchError>) -> ()) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error{
                completion(.failure(.NetworkError))
            }
            if let data = data  {
                do{
                    let allData = try JSONDecoder().decode(T.self, from: data)
                      completion(.success(allData))
                }catch{
                    completion(.failure(.ParsingError))
                }
            }
          
        }.resume()
    }
    
    
}
