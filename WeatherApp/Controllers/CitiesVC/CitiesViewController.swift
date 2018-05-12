//
//  CitiesViewController.swift
//  WeatherApp
//
//  Created by Anna on 02.05.2018.
//  Copyright © 2018 Anna Lutsenko. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class CitiesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    // Models
    let cities = Observable.just(City.defaultCities())
    
    let disposeBag = DisposeBag()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        initController()
    }
    
    func initController() {
        initNavigationBar()
        initTableView()
    }
    
    
    func initNavigationBar() {
        navigationItem.title = Constants.NavigationTitle.cities
    }
    
    func initTableView() {
        tableView.register(UINib(nibName: CityCell.cellID, bundle: nil), forCellReuseIdentifier: CityCell.cellID)
        
        // Create Table View
        cities.bind(to: tableView.rx.items(cellIdentifier: CityCell.cellID, cellType: CityCell.self)) { row, city, cell in
            
            cell.cityLabel.text = city.name
            cell.temperatureLabel.text = String(row)
            }
            .disposed(by: disposeBag)
        
        // Deselect row at indexPath
        tableView.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
            self?.tableView.deselectRow(at: indexPath, animated: true)
            }).disposed(by: disposeBag)
    }

}
