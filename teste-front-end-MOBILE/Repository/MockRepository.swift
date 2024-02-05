//
//  CartRepository.swift
//  teste-front-end-MOBILE
//
//  Created by Luís Eduardo Marinho Fernandes on 04/02/24.
//

import Foundation

struct MockRepositoryModel {
    let item: String
    let price: Double
}

class MockRepository {
    private var cart: [MockRepositoryModel] = []
    private let productInfo = Helper.getProduct()
    private var productAmount = 0
    private var totalPrice = 0.0
    
    func getProductInfo(for id: String, completion: @escaping (_ product: ProductModel) -> Void) {
        completion(self.productInfo)
    }
    
    func addExclusiveItemToCart(for item: String,
                       with price: Double,
                                completion: @escaping (_ totalPrice: Double, _ amount: Int) -> Void,
                       setTicket: @escaping () -> Void) {
        if !cart.contains(where: { $0.item == item }) {
            cart.append(MockRepositoryModel(item: item, price: price))
            observeAmount()
            calculateTotal()
            completion(self.totalPrice, self.productAmount)
        }
        
        let containMandatory = cart.contains(where: { ($0.item == "médio" || $0.item == "grande") })
        if containMandatory {
            setTicket()
        }
        
    }
    
    func addUnlimitedItemToCart(for item: String,
                       with price: Double,
                                completion: @escaping (_ totalPrice: Double, _ amount: Int) -> Void) {
            cart.append(MockRepositoryModel(item: item, price: price))
            self.totalPrice += price
        observeAmount()
        calculateTotal()
        completion(self.totalPrice, self.productAmount)
    }
    
    func addProduct(completion: @escaping (_ totalPrice: Double, _ amount: Int) -> Void) {
        
        self.productAmount += 1
        calculateTotal()
        completion(self.totalPrice, self.productAmount)
    }
    
    func removeProduct(completion: @escaping(_ totalPrice: Double, _ amount: Int) -> Void, setTicket: @escaping () -> Void) {
        self.productAmount -= 1
        if productAmount == 0 {
            cart.removeAll()
            setTicket()
        }
        calculateTotal()
        completion(self.totalPrice, self.productAmount)
    }
    
    private func observeAmount() {
        if cart.isEmpty { productAmount = 0 }
        if cart.count == 1 { productAmount = 1 }
    }
    
    private func calculateTotal() {
        var initial = 0.0
        cart.forEach {
            initial += $0.price
        }
        let final = initial * Double(productAmount)
        self.totalPrice = final
    }
}
