//
//  ProductRepositoryImpl.swift
//  Marketplace
//
//  Created by Jin Zhang on 8/25/25.
//

import Foundation

class FakeProductRepositoryImpl: ProductRepository{

    private var fakeDatabase: FakeDatabase
    
    init(fakeDatabase: FakeDatabase) {
        self.fakeDatabase = fakeDatabase
    }
    
    func getProducts() -> [Product] {
        return fakeDatabase.products
    }
    
    func getCartItems() -> [CartItem] {
        return fakeDatabase.cartItems
    }
    
    //for product in ... loop iterates over copies of each element. Each product inside the loop is an immutable constant (let) by default. So you can read it, but you can’t modify it.
    func addItemQuantity(id: Int) throws {
        for i in 0..<fakeDatabase.cartItems.count {
            if fakeDatabase.cartItems[i].product.id == id {
                fakeDatabase.cartItems[i].quantity += 1
                return
            }
        }
        
        throw MarketError.productNotFound
    }
    
    func reduceItemQuantity(id: Int) {
        for i in 0..<fakeDatabase.cartItems.count {
            
            if fakeDatabase.cartItems[i].product.id == id {
                fakeDatabase.cartItems[i].quantity -= 1
                if fakeDatabase.cartItems[i].quantity == 0 {
                    fakeDatabase.cartItems.remove(at: i)
                }
                
            }
        }
    }
    func cartSummary() -> Int {
        var sum = 0
        for i in 0..<fakeDatabase.cartItems.count {
            sum += fakeDatabase.cartItems[i].quantity
        }
        return sum
    }
    
    
    func priceSummary() -> Double{
        var priceSum: Double = 0.0
        for i in 0..<fakeDatabase.cartItems.count {
            priceSum += (fakeDatabase.cartItems[i].product.price * Double(fakeDatabase.cartItems[i].quantity))
        }
        return priceSum
    }
    
    func updateStorage(id: Int, isAdding: Bool)  {
        if let productIndex = fakeDatabase.products.firstIndex(where: {$0.id == id}){
            if isAdding {
                fakeDatabase.products[productIndex].storage -= 1
            } else {
                fakeDatabase.products[productIndex].storage += 1
        }
    }
        if let cartIndex = fakeDatabase.cartItems.firstIndex(where: {$0.product.id == id}){
            if isAdding {
                fakeDatabase.cartItems[cartIndex].storage -= 1
            } else {
                fakeDatabase.cartItems[cartIndex].storage += 1
        }
    }
        NotificationCenter.default.post(name: .storageUpdate, object: nil)
}
    
    
    
       
}

