//
//  CustomUIColor.swift
//  PolcaSearch
//
//  Created by Taillook on 2017/08/14.
//  Copyright © 2017年 Taillook. All rights reserved.
//

import UIKit

extension UIColor {
    class var main: UIColor {
        return UIColor.hex(hexStr: "009688", alpha: 1.0)
    }

    class var mainDark: UIColor {
        return UIColor.hex(hexStr: "00695c", alpha: 1.0)
    }

    class var sub: UIColor {
        return UIColor.hex(hexStr: "00b8d4", alpha: 1.0)
    }

    class func rgb(r: Int, g: Int, b: Int, alpha: CGFloat) -> UIColor{
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha)
    }

    class func hex(hexStr: String, alpha: CGFloat) -> UIColor {
        var hexStr = hexStr
        let alpha = alpha
        hexStr = hexStr.replacingOccurrences(of: "#", with: "")
        
        if hexStr.count == 3 {
            var newHexStr = ""
            for c in hexStr {
                newHexStr += "\(c)\(c)"
            }
            hexStr = newHexStr
        }
        
        let scanner = Scanner(string: hexStr)
        var color: UInt32 = 0
        if scanner.scanHexInt32(&color) {
            let r = CGFloat((color & 0xFF0000) >> 16) / 255.0
            let g = CGFloat((color & 0x00FF00) >> 8) / 255.0
            let b = CGFloat(color & 0x0000FF) / 255.0
            return UIColor(red:r,green:g,blue:b,alpha:alpha)
        } else {
            print("invalid hex string")
            return UIColor.white
        }
    }
}
