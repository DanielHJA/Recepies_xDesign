//
//  RecepieMapper.swift
//  Recepies_xDesign
//
//  Created by Daniel Hjärtström on 2017-09-19.
//  Copyright © 2017 Daniel Hjärtström. All rights reserved.
//

import UIKit

class RecepieMapper: NSObject {
    
    class func mapRecepie(data: Data, completion: @escaping(_ recepies: [Recepie])->()) {
    
        var recepies = [Recepie]()
        var jsonDictionary: Dictionary<String,Any> = [:]
        
        do {
        
            try jsonDictionary = JSONSerialization.jsonObject(with: data, options: .allowFragments) as! Dictionary<String, Any>
    
        } catch let error {
            
            print("There was an error serializing JSON | Error \(error.localizedDescription) ")
        
        }
        
        for (key, value) in jsonDictionary {
        
            print(key, value)
        
        }
        
     //   let recepie = Recepie(title: <#T##String#>, href: <#T##String#>, ingredients: <#T##String#>, thumbnail: <#T##String?#>)
        
     //   recepies.append(recepie)
    }
}
