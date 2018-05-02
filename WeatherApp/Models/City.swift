
//
//  City.swift
//  WeatherApp
//
//  Created by Anna on 02.05.2018.
//  Copyright © 2018 Anna Lutsenko. All rights reserved.
//

import UIKit

struct City {
    var name: String
    var id: Int
    
    static func defaultCities() -> [City] {
        return [City(name: "Kiev", id: 703448),
                City(name: "Vinnytsya", id: 689558),
                City(name: "Prague", id: 3067696),
                City(name: "London", id: 4119617),
                City(name: "Riga", id: 456172)]
    }
}
