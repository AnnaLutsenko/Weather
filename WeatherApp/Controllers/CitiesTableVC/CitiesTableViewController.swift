//
//  CitiesTableViewController.swift
//  WeatherApp
//
//  Created by Anna on 02.05.2018.
//  Copyright © 2018 Anna Lutsenko. All rights reserved.
//

import UIKit

class CitiesTableViewController: UITableViewController {
    
    // Models
    var cities: [City] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        initController()
    }
    
    func initController() {
        initNavigationBar()
        cities = City.defaultCities()
        tableView.register(UINib(nibName: CityCell.cellID, bundle: nil), forCellReuseIdentifier: CityCell.cellID)
    }
    
    func initNavigationBar() {
        navigationItem.title = Constants.NavigationTitle.cities
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
        cell.temperatureLabel.text = String(indexPath.row)
        //
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
