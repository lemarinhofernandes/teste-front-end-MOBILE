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
    var delegate: ItemViewModelDelegate?
    private var isTickectAvailable = false
    private(set) var amount = 0
    private let repository = MockRepository()
    
    init() {
        fetchProduct()
    }
    
    func addToCart(for item: ItemModel) {
        guard let title = item.itemTitle else { return }
        let price: Double = {
            if item.promoPrice ?? 0 > 0 { return item.promoPrice! }
            if item.price ?? 0 > 0 { return item.price! }
            return 0
        }()
        
        repository.addExclusiveItemToCart(for: title, with: price, completion: { [weak self] totalPrice, amount  in
            self?.totalPrice = totalPrice
            self?.amount = amount
            self?.delegate?.updateTotalValue(totalPrice: self?.totalPrice ?? 0)
        }, setTicket: { [weak self] in
            self?.delegate?.setTicketButton()
        })
    }
    
    func addUnlimitedToCart(for item: ItemModel) {
        guard let title = item.itemTitle else { return }
        let price: Double = {
            if item.promoPrice ?? 0 > 0 { return item.promoPrice! }
            if item.price ?? 0 > 0 { return item.price! }
            return 0
        }()
        
        repository.addUnlimitedItemToCart(for: title, with: price) { [weak self] totalPrice, amount in
            self?.totalPrice = totalPrice
            self?.amount = amount
            self?.delegate?.updateTotalValue(totalPrice: self?.totalPrice ?? 0)
        }
    }
    
    func removeFromCart(for item: ItemModel) {
        // TODO: Implementar a remocao de itens
    }
    
    func fetchProduct() {
        DispatchQueue.main.async { [weak self] in
            self?.delegate?.updateProduct(product: Helper.getProduct())
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
