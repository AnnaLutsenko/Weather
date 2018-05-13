//
//  CityDataProvider.swift
//  WeatherApp
//
//  Created by Anna on 13.05.2018.
//  Copyright © 2018 Anna Lutsenko. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class CityDataProvider {
    static let shared = CityDataProvider()
    
    var selectedCity = Variable<City?>(City(name: "Vinnytsya", id: 689558))
    var selectedCitiesObservable: Observable<City>!
    
    
    fileprivate let disposeBag = DisposeBag()
    
    
    init() {
        setup()
    }
    
    func setup() {
        selectedCitiesObservable = selectedCity.asObservable()
            .map({ selectCity in
                guard let city = selectCity else { return City(name: "Vinnytsya", id: 689558)}

                return city
            })
    }
}
