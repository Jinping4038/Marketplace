//
//  Untitled.swift
//  Marketplace
//
//  Created by Jin Zhang on 8/25/25.
//

import Foundation
 
protocol ProductRepository{
    func getProducts() -> [Product]
    func getCartItems() -> [CartItem]
    func addItemQuantity(id: Int) throws
    func reduceItemQuantity(id:Int)
    func cartSummary() -> Int
    func priceSummary() -> Double
  
}
