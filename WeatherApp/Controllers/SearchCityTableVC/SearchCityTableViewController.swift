//
//  SearchCityTableViewController.swift
//  WeatherApp
//
//  Created by Anna on 11.05.2018.
//  Copyright © 2018 Anna Lutsenko. All rights reserved.
//

import UIKit

class SearchCityTableViewController: UITableViewController {
    
    /// UI Elements
    @IBOutlet weak var searchBar: UISearchBar!
    
    /// Models
    var cities: [City] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CityCell.cellID) as? CityCell else {
            return UITableViewCell()
        }
        //
        let city = cities[indexPath.row]
        cell.cityLabel.text = city.name
        cell.temperatureLabel.isHidden = true
        //

        return cell
    }
    
}

extension SearchCityTableViewController: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        dismiss(animated: true, completion: nil)
    }
}
