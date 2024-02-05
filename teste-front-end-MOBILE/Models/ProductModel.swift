//
//  ProductModel.swift
//  teste-front-end-MOBILE
//
//  Created by Luís Eduardo Marinho Fernandes on 03/02/24.
//

import UIKit

struct ProductModel {
    var productImage: UIImage?
    var productTitle: String?
    var minimumPrice: Double?
    var productAmount: Int?
    var productDescription: String?
    var totalPrice: Double?
    var sizes: [ItemModel]?
    var drinks: [ItemModel]?
    var cutleries: [ItemModel]?
    var aditional: [ItemModel]?
}
