//
//  SearchCityViewController.swift
//  WeatherApp
//
//  Created by Anna on 13.05.2018.
//  Copyright © 2018 Anna Lutsenko. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class SearchCityViewController: UIViewController {
    
    /// UI Elements
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    /// Models
    let allCities = City.allCities() //Variable<[City]>(City.allCities())
    var shownCities: Variable<[City]> = Variable([])
    let city = PublishSubject<City>()
    
    /// Data Provider
    let dataProvider = CityDataProvider.shared
    
    /// used to keep all things that I want to unsubscribe from in the deinit process
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initController()
    }
    
    func initController() {
        bindTableView()
        initSearchBar()
    }
    
    func initSearchBar()  {
        searchBar.becomeFirstResponder()
        
        // Implemented Searching
        searchBar
            .rx.text
            .orEmpty
            .debounce(0.5, scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .filter { !$0.isEmpty }
            .subscribe(onNext: { [unowned self] query in
                self.shownCities.value = self.allCities.filter { $0.name.hasPrefix(query) }
                self.tableView.reloadData()
            })
            .disposed(by: disposeBag)
        
        // Action for Cancel button
        searchBar.rx.cancelButtonClicked.subscribe(onNext: { [weak self] _ in
            self?.dismiss(animated: true, completion: nil)
        })
        .disposed(by: disposeBag)
    }
    
    func bindTableView() {
        tableView.register(UINib(nibName: CityCell.cellID, bundle: nil), forCellReuseIdentifier: CityCell.cellID)
        
        // Create Table View
        shownCities.asObservable().bind(to: tableView.rx.items(cellIdentifier: CityCell.cellID, cellType: CityCell.self)) { row, city, cell in
            
            cell.cityLabel.text = city.name
            cell.temperatureLabel.isHidden = true
            }
            .disposed(by: disposeBag)
        
        // Deselect row at indexPath
        tableView.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                self?.tableView.deselectRow(at: indexPath, animated: true)
                //
                guard let selectCity = self?.shownCities.value[indexPath.row] else { return }
                self?.dataProvider.city.onNext(selectCity)
                //
                self?.dismiss(animated: true, completion: nil)
                //
            }).disposed(by: disposeBag)
    }
    
}
