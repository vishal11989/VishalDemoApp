//
//  APIClient.swift
//  VishalDemoApp
//
//  Created by Vishal Patel on 25/02/20.
//  Copyright © 2020 Vishal Patel. All rights reserved.
//

import Foundation

let baseUrl = "http://dummy.restapiexample.com/api/v1/"

let employeeList = "employees"

struct ServiceResponse<Element:Decodable>:Decodable {
    let status:String
    let data:Element
}

struct APIClient {
    
    func fetch<T: Decodable>(url: String, completion: @escaping  (Result<T, Error>) -> ()) {
        let baseURL = URL(string: baseUrl)
        guard let url = baseURL?.appendingPathComponent(url) else {
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            do {
                let response = try JSONDecoder().decode(T.self, from: data!)
                completion(.success(response))
            } catch let err {
                completion(.failure(err))
            }
        }.resume()
    }
    
}
