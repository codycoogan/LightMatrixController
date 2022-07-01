//
//  MatrixBase.swift
//  LightMatrixController (iOS)
//
//  Created by Cody Coogan on 6/26/22.
//

import Foundation

class Base {
    func sendRequest(destinationUrl: String){
        let session = URLSession(configuration: .default)
        let url = URL(string: destinationUrl)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = [
            "Content-Type": "text/html"
        ]
        
        let task = session.dataTask(with: request) { data, response, error in
            // TODO add response
            print(data as Any? as Any)
            if let data = data {
                print(String(data: data, encoding: .utf8)!)
            } else {
                print("no data")
            }
        }
        task.resume()
    }
}
