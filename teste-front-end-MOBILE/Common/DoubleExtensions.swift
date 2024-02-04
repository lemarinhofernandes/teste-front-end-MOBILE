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
}
