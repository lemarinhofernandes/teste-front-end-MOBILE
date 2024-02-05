//
//  ProductModel.swift
//  teste-front-end-MOBILE
//
//  Created by Luís Eduardo Marinho Fernandes on 03/02/24.
//

import UIKit

struct ProductModel {
    let productImage: UIImage?
    let productTitle: String?
    let minimumPrice: Double?
    let productAmount: Int?
    let productDescription: String?
    let totalPrice: Double?
    let sizes: [ItemModel]?
    let drinks: [ItemModel]?
    let cutleries: [ItemModel]?
    let aditional: [ItemModel]?
}
