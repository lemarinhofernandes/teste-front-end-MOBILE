//
//  AiqColors.swift
//  teste-front-end-MOBILE
//
//  Created by Luís Eduardo Marinho Fernandes on 04/02/24.
//

import UIKit


extension UIColor {
    static func AIQPromoGreen() -> UIColor {
        return self.hexStringToUIColor(hex: "#02A117")
    }
    
    static func AIQTeal() -> UIColor {
        return self.hexStringToUIColor(hex: "#00A296")
    }
    
    static func AIQNeutralGray() -> UIColor {
        return self.hexStringToUIColor(hex: "#A8ADB7")
    }
    
    static func AIQNeutralGray2() -> UIColor {
        return self.hexStringToUIColor(hex: "#6D6F73")
    }
    
    static func AIQDarkGray() -> UIColor {
        return self.hexStringToUIColor(hex: "#393A3C")
    }
    
    static func AIQSubtitleGray() -> UIColor {
        return self.hexStringToUIColor(hex: "#202326")
    }
    
    static func AIQMainPurple() -> UIColor {
        return self.hexStringToUIColor(hex: "#7B1FA2")
    }
    
    static func AIQFooterPurple() -> UIColor {
        return self.hexStringToUIColor(hex: "#580F78")
    }
    
    static func AIQBackground() -> UIColor {
        return self.hexStringToUIColor(hex: "#EEF0F5")
    }
    
    static func AIQHeaderPurple() -> UIColor {
        return self.hexStringToUIColor(hex: "#EECFFC")
    }
    
    static func AIQBorderGray() -> UIColor {
        return self.hexStringToUIColor(hex: "#CDD1D9")
    }
    
   private static func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
