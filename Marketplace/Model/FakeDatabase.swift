//
//  FakeDatabase.swift
//  Marketplace
//
//  Created by Jin Zhang on 8/25/25.
//

import Foundation

var productList = [
    Product(id: 1, storage: 5, name: "Apple", category:  ProductCategory.Grocery, price: 3.9, discount: PriceRule.Percent(3)),
    Product(id: 2, storage: 5, name: "Sheet", category:  ProductCategory.HomeProducts, price: 3.9, discount: PriceRule.Percent(3)),
    Product(id: 3, storage: 5, name: "Computer", category:  ProductCategory.Electronics, price: 3.9, discount: PriceRule.Percent(3)),
    Product(id: 4, storage: 5, name: "Vegetables", category:  ProductCategory.Grocery, price: 3.9, discount: PriceRule.Percent(3))
]

class FakeDatabase {
    
    //Singleton: no one can create another database
    static var instance = FakeDatabase()
    
    private init() {}
    
    var products: [Product] = productList
    var cartItems: [CartItem] = [
        CartItem(product: productList[0], quantity: 3, storage: 5),
        CartItem(product: productList[1], quantity: 2, storage: 5)
    ]
}
