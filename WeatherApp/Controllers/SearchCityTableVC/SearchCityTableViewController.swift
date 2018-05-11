//
//  SearchCityTableViewController.swift
//  WeatherApp
//
//  Created by Anna on 11.05.2018.
//  Copyright © 2018 Anna Lutsenko. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SearchCityTableViewController: UITableViewController {
    
    /// UI Elements
    @IBOutlet weak var searchBar: UISearchBar!
    
    /// Models
    var cities: [City] = []
    var shownCities: [City] = []
    
    /// used to keep all things that I want to unsubscribe from in the deinit process
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        initContoller()
    }
    
    func initContoller() {
        cities = City.allCities()
        tableView.register(UINib(nibName: CityCell.cellID, bundle: nil), forCellReuseIdentifier: CityCell.cellID)
        //
        searchBar.becomeFirstResponder()
        //
        searchBar
            .rx.text
            .orEmpty
            .debounce(0.5, scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .filter { !$0.isEmpty }
            .subscribe(onNext: { [unowned self] query in
                self.shownCities = self.cities.filter { $0.name.hasPrefix(query) }
                self.tableView.reloadData()
            })
            .disposed(by: disposeBag)
    }

    // MARK: - UITableViewDataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shownCities.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CityCell.cellID) as? CityCell else {
            return UITableViewCell()
        }
        //
        let city = shownCities[indexPath.row]
        cell.cityLabel.text = city.name
        cell.temperatureLabel.isHidden = true
        //
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //
        
    }
    
}

extension SearchCityTableViewController: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        dismiss(animated: true, completion: nil)
    }
}
