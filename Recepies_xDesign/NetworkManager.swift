//
//  NetworkManager.swift
//  Recepies_xDesign
//
//  Created by Daniel Hjärtström on 2017-09-19.
//  Copyright © 2017 Daniel Hjärtström. All rights reserved.
//

import UIKit

class NetworkManager {

    class func dataTask(url: String, compeltion: @escaping (_ data: Data?, _ error: Error?)->()) {
    
        guard let url = URL(string: url) else {
            print("Something went wrong when creating the URL ")
            return
        }
        
        let request = URLRequest(url: url)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        session.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
            
                compeltion(nil, error)
                
            } else {
            
                compeltion(data, nil)
            
            }
        }.resume()
    }
}
