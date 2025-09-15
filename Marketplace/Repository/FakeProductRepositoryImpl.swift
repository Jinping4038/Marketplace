//
//  ProductRepositoryImpl.swift
//  Marketplace
//
//  Created by Jin Zhang on 8/25/25.
//

import Foundation
//class ProductRepositoryImpl: ProductRepository{
   
//    func getProducts() -> [Product] {
//        return products
//    }
    
    
//}


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
    
    
    
}
