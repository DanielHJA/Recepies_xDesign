//
//  DetailViewController.swift
//  Recepies_xDesign
//
//  Created by Daniel Hjärtström on 2017-09-19.
//  Copyright © 2017 Daniel Hjärtström. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var recepie: Recepie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = recepie.title
        
    }
    
    @IBAction func popViewController(_ sender: UIBarButtonItem) {

        let navController = self.navigationController as! NavController
        navController.dismiss()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
