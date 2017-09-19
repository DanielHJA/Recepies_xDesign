//
//  RecepieTableViewCell.swift
//  Recepies_xDesign
//
//  Created by Daniel Hjärtström on 2017-09-19.
//  Copyright © 2017 Daniel Hjärtström. All rights reserved.
//

import UIKit

class RecepieTableViewCell: UITableViewCell, SetRecepieImageProtocol {

    @IBOutlet weak var recepieNameLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setThumbnailImage(thumbnail: UIImage) {
        
        DispatchQueue.main.async {
     
            self.thumbnailImageView.image = thumbnail
            
        }
    }
}
