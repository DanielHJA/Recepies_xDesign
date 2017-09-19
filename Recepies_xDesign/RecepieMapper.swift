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

            var title: String = "No title"
            var ingredients: String = ""
            let href = object["href"] as! String
            let thumbnail = object["thumbnail"] as! String
            
            do {
            
                title = try (object["title"] as! String).convertHtmlSymbols()!
                ingredients = try (object["ingredients"] as! String).convertHtmlSymbols()!
                
            } catch let error {
                print("There was an error converting HTML to text | Error: \(error.localizedDescription)")
            }
            
            let recepie = Recepie(title: title, href: href, ingredients: ingredients, thumbnail: thumbnail)
            
            recepies.append(recepie)
            
        }
        
        completion(recepies)
    }
}

extension String {
    
    func convertHtmlSymbols() throws -> String? {
        guard let data = data(using: .utf8) else { return nil }
        
        return try NSAttributedString(data: data, options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute: String.Encoding.utf8.rawValue], documentAttributes: nil).string
    }
}
