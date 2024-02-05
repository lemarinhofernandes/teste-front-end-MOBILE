//
//  DoubleExtensions.swift
//  teste-front-end-MOBILE
//
//  Created by Luís Eduardo Marinho Fernandes on 03/02/24.
//

import Foundation

extension Double? {
    func toString() -> String {
        guard let strongSelf = self else {
            return String()
        }
        return String(describing: strongSelf)
    }
    
    func toCurrenryString() -> String {
        guard let strongSelf = self else {
            return String()
        }
        return "R$\(String(describing:df2so(strongSelf)))"
    }
    
    func toPlusCurrencyString() -> String {
        guard let strongSelf = self else {
            return String()
        }
        return "R$\(String(describing:df2so(strongSelf)))"
    }
    
    private func df2so(_ price: Double) -> String{
            let numberFormatter = NumberFormatter()
            numberFormatter.decimalSeparator = ","
            numberFormatter.numberStyle = .decimal
            numberFormatter.maximumFractionDigits = 2
            numberFormatter.minimumFractionDigits = 2
            return numberFormatter.string(from: price as NSNumber)!
        }
}

extension Double {
    func toString() -> String {
        return String(describing: self)
    }
    
    func toCurrenryString() -> String {
        return "R$\(df2so(self))"
    }
    
    func toPlusCurrencyString() -> String {
        return "+R$\(df2so(self))"
    }
    
    private func df2so(_ price: Double) -> String{
            let numberFormatter = NumberFormatter()
            numberFormatter.decimalSeparator = ","
            numberFormatter.numberStyle = .decimal
            numberFormatter.maximumFractionDigits = 2
            numberFormatter.minimumFractionDigits = 2
            return numberFormatter.string(from: price as NSNumber)!
        }
}
