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
    
    let city = PublishSubject<City>()
}
