//
//  UIColor.swift
//  WeatherApp
//
//  Created by Anna on 02.05.2018.
//  Copyright © 2018 Anna Lutsenko. All rights reserved.
//

import UIKit

extension UIColor {
    
    class func rgba(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat) -> UIColor {
        let maxValue : CGFloat = 255
        return UIColor(red: r / maxValue, green: g / maxValue, blue: b / maxValue, alpha: a)
    }
    
    open class var customGreyCell: UIColor {
        return UIColor.rgba(245, 245, 245, 1)
    }

}
