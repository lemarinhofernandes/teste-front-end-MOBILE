//
//  ProductModel.swift
//  teste-front-end-MOBILE
//
//  Created by Luís Eduardo Marinho Fernandes on 02/02/24.
//

import Foundation

struct ProductModel {
    let id: Int?
    let minimumPrice: Double?
    let sizes: [SizeModel]?
    let drinks: [DrinkModel]?
    let cutlery: [CutleryModel]?
    let aditional: [AditionalModel]?
}

struct SizeModel {
    let id: Int?
    let title: String?
    let price: Double?
    let hasPromo: Bool?
    let promoPrice: Double?
}

struct DrinkModel {
    let id: Int?
    let title: String?
    let price: Double?
}

struct CutleryModel {
    let id: Int?
    let title: String?
    let price: Double?
}

struct AditionalModel {
    let id: Int?
    let title: String?
    let price: Double?
}
