//
//  Recepie.swift
//  Recepies_xDesign
//
//  Created by Daniel Hjärtström on 2017-09-19.
//  Copyright © 2017 Daniel Hjärtström. All rights reserved.
//

import UIKit

protocol SetRecepieImageProtocol {
    func setThumbnailImage()
}

class Recepie: NSObject {
    
    var title: String!
    var href: URL!
    var ingredients = [String]()
    var thumbnail: UIImage?
    var delegate: SetRecepieImageProtocol?
    
    init(title: String, href: String, ingredients: String, thumbnail: String?) {
        super.init()
        
        self.title = title
        self.href = URL(string: href)
        self.ingredients = ingredients.components(separatedBy: ",")
        
        guard let thumbnail = thumbnail else { return }
        
        self.fetchThumbnail(url: thumbnail)
    }
    
    func fetchThumbnail(url: String) {
        
        NetworkManager.dataTask(url: url) { (data, error) in
            
            if let data = data {
                
                self.thumbnail = UIImage(data: data)
                self.delegate?.setThumbnailImage()
                
            } else {
                
                print("There was an error fetching the thumbnail | Error: \(error!.localizedDescription)")
                
            }
        }
    }
}
