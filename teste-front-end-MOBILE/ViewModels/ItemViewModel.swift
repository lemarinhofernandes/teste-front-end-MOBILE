//
//  ItemViewModel.swift
//  teste-front-end-MOBILE
//
//  Created by Luís Eduardo Marinho Fernandes on 03/02/24.
//

import Foundation

protocol ViewModelProtocol {
    func addToCart(for item: ItemModel)
    func removeFromCart(for item: ItemModel)
}

protocol ItemViewModelDelegate {
    func updateTotalValue(totalPrice: Double)
    func updateProduct(product: ProductModel)
    func setTicketButton()
}

class ItemViewModel: ViewModelProtocol {
    
    private(set) var totalPrice: Double = 0
    private var cart: [CartModel] = []
    var delegate: ItemViewModelDelegate?
    private var isTickectAvailable = false
    private(set) var amount = 0
    private let repository = MockRepository()
    
    init() {
        fetchProduct()
    }
    
    func addToCart(for item: ItemModel) {
        
        repository.addItemToCart(for: "12", with: item.price ?? 0, completion: { [weak self] totalPrice in
            self?.totalPrice = totalPrice
            self?.delegate?.updateTotalValue(totalPrice: self?.totalPrice ?? 0)
        }, setTicket: { [weak self] in
            self?.delegate?.setTicketButton()
        })
    }
    
    func removeFromCart(for item: ItemModel) {
        cart.removeAll { itemCart in
            if itemCart.itemTitle == item.itemTitle {
                self.totalPrice -= itemCart.price
                self.delegate?.updateTotalValue(totalPrice: self.totalPrice)
                print(self.cart)
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
    
    func addProduct() {
        repository.addProduct { [weak self] totalPrice, amount  in
            self?.totalPrice = totalPrice
            self?.amount = amount
            self?.delegate?.updateTotalValue(totalPrice: self?.totalPrice ?? 0)
        }
    }
    
}
