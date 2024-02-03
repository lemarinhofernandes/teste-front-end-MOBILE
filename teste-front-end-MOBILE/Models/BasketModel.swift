//
//  BasketModel.swift
//  teste-front-end-MOBILE
//
//  Created by Luís Eduardo Marinho Fernandes on 02/02/24.
//

import Foundation

struct BasketModel {
    let totalPrice: Double
    let size: SizeModel
    let drinks: [DrinkModel]?
    let cutlery: CutleryModel?
    let aditional: AditionalModel?
    let observation: String?
    let quantity: Int?
}
