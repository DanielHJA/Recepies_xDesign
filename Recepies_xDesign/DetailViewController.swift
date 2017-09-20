//
//  DetailViewController.swift
//  Recepies_xDesign
//
//  Created by Daniel Hjärtström on 2017-09-19.
//  Copyright © 2017 Daniel Hjärtström. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!

    var recepie: Recepie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.navigationItem.title = recepie.title
        thumbnailImageView.image = recepie.thumbnail
        
    }
    
    @IBAction func popViewController(_ sender: UIBarButtonItem) {

        let navController = self.navigationController as! NavController
        navController.dismiss()
    
    }

    @IBAction func loadFullRecepie(_ sender: UIButton) {
    
        guard let url = recepie.href else { return }
        
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        print("Detail ViewController deinit")
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recepie.ingredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifiers.ingredientsCell, for: indexPath)
        
        cell.textLabel?.text = recepie.ingredients[indexPath.row].capitalized
        cell.isUserInteractionEnabled = false
        
        return cell
    }
}
