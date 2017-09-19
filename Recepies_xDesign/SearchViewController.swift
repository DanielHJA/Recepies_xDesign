//
//  ViewController.swift
//  Recepies_xDesign
//
//  Created by Daniel Hjärtström on 2017-09-19.
//  Copyright © 2017 Daniel Hjärtström. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var recepies = [Recepie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.searchBar.delegate = self
    
        NetworkManager.dataTask(url: Constants.API.recepiesURL + "omelet") { [weak self] (data, error) in
            
            RecepieMapper.mapRecepie(data: data!, completion: { (recepies) in
                
                
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension SearchViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        NetworkManager.dataTask(url: searchText) { [weak self] (data, error) in
            
            
            
        }
    }
}

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recepies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifiers.recepieCell, for: indexPath) as! RecepieTableViewCell
        
        let current = recepies[indexPath.row]
 
        cell.recepieName.text = current.title
        current.delegate = cell

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    
        print("Clicked a recepie")
    
    }
}

