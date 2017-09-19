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
        
        let results = jsonDictionary["results"] as! [Dictionary<String, Any>]
        
        for object in results {
        
            let title = object["title"] as! String
            let href = object["href"] as! String
            let ingredients = object["ingredients"] as! String
            let thumbnail = object["thumbnail"] as! String
        
            let recepie = Recepie(title: title, href: href, ingredients: ingredients, thumbnail: thumbnail)
            
            recepies.append(recepie)
            
        }
        
        completion(recepies)
    }
}
