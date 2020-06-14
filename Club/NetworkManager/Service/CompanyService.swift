//
//  CompanyService.swift
//  Club
//
//  Created by AA/MP/05 on 14/06/20.
//  Copyright © 2020 Jogendar Singh. All rights reserved.
//

import Foundation

class CompanyService: BaseService {
    
    func fetchCompanyListing(completion: @escaping(Result<[Company], ResponseError>) -> Void) {
        callAPI { result in
            switch result {
            case .success(let responseData):
                do {
                   let response = try JSONDecoder().decode([Company].self, from: responseData)
                    completion(.success(response))
                } catch(let error) {
                    completion(.failure(.cannotProcessResponse))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    func downloadImageWith(url: String?, completion: @escaping(Result<Data, ResponseError>) -> Void) {
        callAPI(url, completion: completion)
    }
}
