
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
    
    static func allCities() -> [City] {
        
        return [City(name: "Abbenrode", id: 2959884),
                City(name: "Absberg", id: 2959803),
                City(name: "Acara", id: 3408386),
                City(name: "Aceguá", id: 3473204),
                City(name: "Borá", id: 3469189),
                City(name: "Borex", id: 7285296),
                City(name: "Bom Sucesso", id: 3469367),
                City(name: "Bom Jardim de Minas", id: 3469455),
                City(name: "Bom Jardim da Serra", id: 3469459),
                City(name: "Hurzuf", id: 707860),
                City(name: "Hurum", id: 3151404),
                City(name: "Hulsede", id: 2897800),
                City(name: "Kielpin", id: 769233),
                City(name: "Kielanowka", id: 769256),
                City(name: "Kiev", id: 703448),
                City(name: "London", id: 4119617),
                City(name: "Paris", id: 4402452),
                City(name: "Prague", id: 3067696),
                City(name: "Prajeni", id: 669730),
                City(name: "Princes Town", id: 3573882),
                City(name: "Riga", id: 456172),
                City(name: "Vinnytsya", id: 689558),
                City(name: "Vienna", id: 4413085)]
    }
    
}
