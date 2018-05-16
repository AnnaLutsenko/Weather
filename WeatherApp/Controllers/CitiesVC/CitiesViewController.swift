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
    
    /// UI Elements
    @IBOutlet weak var tableView: UITableView!
    
    /// Managers
    let dataProvider = CityDataProvider.shared
    
    // Models
    var cities = BehaviorRelay<[City]>(value: City.defaultCities())
    
    ///
    let disposeBag = DisposeBag()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        initController()
    }
    
    func initController() {
        initNavigationBar()
        bindTableView()
    }
    
    
    func initNavigationBar() {
        navigationItem.title = Constants.NavigationTitle.cities
    }
    
    func bindTableView() {
        tableView.register(UINib(nibName: CityCell.cellID, bundle: nil), forCellReuseIdentifier: CityCell.cellID)
        
        // Create Table View
        cities.asObservable().bind(to: tableView.rx.items(cellIdentifier: CityCell.cellID, cellType: CityCell.self)) { row, city, cell in
            
            cell.cityLabel.text = city.name
            cell.temperatureLabel.text = String(row)
            }
            .disposed(by: disposeBag)
        
        // Deselect row at indexPath
        tableView.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
            self?.tableView.deselectRow(at: indexPath, animated: true)
                
            }).disposed(by: disposeBag)
        
        //
        dataProvider.city.asObserver()
            .subscribe({ [weak self] city in
                guard let city = city.element else {return}
                var newCities = self?.cities.value
                newCities?.append(city)
                self?.cities.accept(newCities ?? [city])
        }).disposed(by: disposeBag)
        
    }

}
