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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// Searchbar delegate
extension SearchViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
                
        let url = "\(Constants.API.recepiesURL)\(searchText)"
        
        NetworkManager.dataTask(url: url) { [weak self] (data, error) in
            
            guard let data = data else { return }
            
            RecepieMapper.mapRecepie(data: data, completion: { (recepies) in
                
                self?.recepies = recepies
                
                DispatchQueue.main.async {
                    
                    self?.tableView.reloadData()
                    
                }
            })
        }
    }
}

// Tableview delegate
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

        current.delegate = cell
        cell.recepieNameLabel.text = current.title

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
