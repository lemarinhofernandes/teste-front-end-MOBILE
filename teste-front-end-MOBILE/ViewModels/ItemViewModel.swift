//
//  ItemViewModel.swift
//  teste-front-end-MOBILE
//
//  Created by Luís Eduardo Marinho Fernandes on 03/02/24.
//

import Foundation

protocol ItemViewModelProtocol {
    func getProductInfo() -> ProductModel
    func addToCart(for item: ItemModel, isExclusive: Bool)
    func removeFromCart(for item: ItemModel)
}

protocol ItemViewModelDelegate {
    func updateTotalValue(totalPrice: Double)
    func updateProduct(product: ProductModel)
}

class ItemViewModel: ItemViewModelProtocol {
    private(set) var totalPrice: Double = 0
    private var cart: [CartModel] = []
    var delegate: ItemViewModelDelegate?
    
    init() {
        fetchProduct()
    }
    
    func addToCart(for item: ItemModel, isExclusive: Bool) {
        cart.append(CartModel(itemTitle: item.itemTitle!, price: item.promoPrice ?? item.price!, isExclusive: isExclusive))
        totalPrice += item.price ?? 0
        delegate?.updateTotalValue(totalPrice: self.totalPrice)
    }
    
    func removeFromCart(for item: ItemModel) {
        cart.removeAll { itemCart in
            if itemCart.itemTitle == item.itemTitle {
                self.totalPrice -= itemCart.price
                self.delegate?.updateTotalValue(totalPrice: self.totalPrice)
                return true
            }
            return false
        }
    }
    
    func fetchProduct() {
        DispatchQueue.main.async { [weak self] in
            self?.delegate?.updateProduct(product: Helper.getProduct())
            self?.totalPrice = Helper.getProduct().minimumPrice ?? 0
        }
        
    }
    
    func getCart() -> [CartModel] {
        return self.cart
    }
    
    func getProductInfo() -> ProductModel {
        return Helper.getProduct()
    }
    
}
