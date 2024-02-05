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
                       completion: @escaping (_ totalPrice: Double) -> Void,
                       setTicket: @escaping () -> Void) {
        if !cart.contains(where: { $0.item == item }) {
            cart.append(MockRepositoryModel(item: item, price: price))
            self.totalPrice += price
            print(cart)
            completion(self.totalPrice)
        }
        
        let containMandatory = cart.contains(where: { ($0.item == "médio" || $0.item == "grande") })
        if containMandatory {
            setTicket()
        }
        
    }
    
    func addUnlimitedItemToCart(for item: String,
                       with price: Double,
                       completion: @escaping (_ totalPrice: Double) -> Void) {
            cart.append(MockRepositoryModel(item: item, price: price))
            self.totalPrice += price
            print(cart)
            completion(self.totalPrice)
    }
    
    func addProduct(completion: @escaping (_ totalPrice: Double, _ amount: Int) -> Void) {
        print(self.cart)
        if cart.contains(where: { $0.item == productInfo.productTitle }) {
            let actualPrice = totalPrice
            self.totalPrice = actualPrice * 2
        } else {
            self.cart.append(MockRepositoryModel(item: productInfo.productTitle ?? "", price: productInfo.minimumPrice ?? 0))
            self.totalPrice += productInfo.minimumPrice ?? 0
        }
        self.productAmount += 1
        completion(self.totalPrice, self.productAmount)
    }
    
    func removeProduct(completion: @escaping(_ totalPrice: Double) -> Void) {
        let actualPrice = totalPrice
        self.totalPrice = actualPrice / 2
        completion(self.totalPrice)
    }
}
