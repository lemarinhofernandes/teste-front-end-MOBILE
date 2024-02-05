//
//  Helper.swift
//  teste-front-end-MOBILE
//
//  Created by Luís Eduardo Marinho Fernandes on 03/02/24.
//

import Foundation
import UIKit

final class Helper {
    private static let productTitle = "Ceviche de salmão"
    private static let productDescription = "salmão temperado com limão, cebola e pimenta"
    private static let minimumPrice = 19.9
    private static let productAmount = 0
    private static let productImage = UIImage(named: "mainimage")
    
    static func getProduct() -> ProductModel {
        let productBuilder = ProductModel(productImage: Helper.productImage, productTitle: Helper.productTitle, minimumPrice: minimumPrice, productAmount: Helper.productAmount, productDescription: Helper.productDescription, totalPrice: 0, sizes: getSizes(), drinks: getDrinks(), cutleries: getCutlery(), aditional: getAditional())
        return productBuilder
    }
    
    static func getSizes() -> [ItemModel] {
        let items = [
            ItemModel(itemTitle: "médio", price: 22.90, hasPromo: true, promoPrice: 19.90),
            ItemModel(itemTitle: "grande", price: 28.90, hasPromo: false, promoPrice: nil)
        ]
        return items
    }
    
    static func getDrinks() -> [ItemModel] {
        let items = [
            ItemModel(itemTitle: "coca-cola", price: 5, hasPromo: false, promoPrice: nil),
            ItemModel(itemTitle: "suco prats laranja", price: 6.00, hasPromo: false, promoPrice: nil),
            ItemModel(itemTitle: "água sem gás", price: 3.00, hasPromo: false, promoPrice: nil),
        ]
        return items
    }
    
    static func getCutlery() -> [ItemModel] {
        let items = [
            ItemModel(itemTitle: "hashi", price: nil, hasPromo: false, promoPrice: nil),
            ItemModel(itemTitle: "garfo e faca descartável", price: 1.00, hasPromo: false, promoPrice: nil)
        ]
        return items
    }
    
    static func getAditional() -> [ItemModel] {
        let items = [
            ItemModel(itemTitle: "biscoito da sorte", price: 2.90, hasPromo: false, promoPrice: nil),
            ItemModel(itemTitle: "rolinho primaveira", price: 8.00, hasPromo: false, promoPrice: nil)
        ]
        return items
    }
}
