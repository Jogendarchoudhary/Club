//
//  BaseService.swift
//  Club
//
//  Created by AA/MP/05 on 14/06/20.
//  Copyright © 2020 Jogendar Singh. All rights reserved.
//

import Foundation

enum ResponseError: Error {
    case noDataAvailable
    case urlNotValid
    case cannotProcessResponse
}

class BaseService: NSObject {
    
    static let baseUrlString = "https://next.json-generator.com/api/json/get/Vk-LhK44U"
    
    func callAPI(_ url: String? = baseUrlString, completion: @escaping(Result<Data, ResponseError>) -> Void) {
        
        guard let baseUrl = URL(string: url ?? BaseService.baseUrlString) else {
            completion(.failure(.urlNotValid))
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: baseUrl) { (data, _, _) in
            guard let responseData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            completion(.success(responseData))
        }
        dataTask.resume()
    }
}
