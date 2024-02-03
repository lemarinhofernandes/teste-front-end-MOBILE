//
//  ItemViewModel.swift
//  teste-front-end-MOBILE
//
//  Created by Luís Eduardo Marinho Fernandes on 02/02/24.
//

import Foundation

class ItemViewModel {
    private(set) var product: ProductModel = ProductModel(id: nil, minimumPrice: nil, sizes: nil, drinks: nil, cutlery: nil, aditional: nil)
    private(set) var totalPrice: Double = 0
    private(set) var productQuantity: Int = 0
    private(set) var size: SizeModel = SizeModel(id: nil, title: nil, price: nil, hasPromo: nil, promoPrice: nil)
    private(set) var drink: DrinkModel = DrinkModel(id: nil, title: nil, price: nil)
    private(set) var cutlery: CutleryModel = CutleryModel(id: nil, title: nil, price: nil)
    private(set) var aditional: AditionalModel = AditionalModel(id: nil, title: nil, price: nil)
    private(set) var observation: String?
    private(set) var isLoading: Bool = false
    
    init(for id: String?) {
        // network call
        guard let id = id else {
            return
        }
        getProduct(for: id)
    }
    
    func addToBasket(for id: Int) {
        
    }
    
    func removeFromBasket(for id: Int) {
        
    }
    
    func addProductToBasket(for id: String) {
        
    }
    
    func getProduct(for productId: String) {
        let sizes = [SizeModel(id: 1, title: "médio", price: 22.90, hasPromo: true, promoPrice: 19.90), SizeModel(id: 2, title: "grande", price: 28.90, hasPromo: false, promoPrice: nil)]
        let drinks = [DrinkModel(id: 1, title: "coca-cola", price: 10.00), DrinkModel(id: 2, title: "suco prats laranja", price: 06.00), DrinkModel(id: 3, title: "água sem gás", price: 03.00)]
        let cutlery = [CutleryModel(id: 1, title: "hashi", price: nil), CutleryModel(id: 2, title: "garfo e faca descartável", price: 01.00)]
        let aditional = [AditionalModel(id: 1, title: "biscoito da sorte", price: 2.00), AditionalModel(id: 2, title: "rolinho primavera", price: 8.00)]
        
        self.product = ProductModel(id: 1, minimumPrice: 19.90, sizes: sizes, drinks: drinks, cutlery: cutlery, aditional: aditional)
    }
    
}
