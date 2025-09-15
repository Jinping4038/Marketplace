//
//  ProductViewModel.swift
//  Marketplace
//
//  Created by Jin Zhang on 8/25/25.
//

import Foundation
class CartViewModel: ObservableObject {
    @Published var cartItems: [CartItem] = []
    @Published var total = 0
    @Published var totalPrice = 0.0
   
    private var repository: ProductRepository
        
    init(repository: ProductRepository) {
        self.repository = repository
        updateCartProducts()
        totalNumber()
        updatePriceSummary()
    }
    
    func updateCartProducts(){
        cartItems = repository.getCartItems()
    }
    
    func reduceFromCart(id: Int){
        repository.reduceItemQuantity(id: id)
        updateCartProducts()
        totalNumber()
        updatePriceSummary()

    }
    
    func addToCart(id: Int){
        do {
            try repository.addItemQuantity(id: id)
        } catch let error as MarketError {
            print("Error: \(error.description)")
        } catch {
            print("Error: \(error.localizedDescription)")
        }
        
        updateCartProducts()
        totalNumber()
        updatePriceSummary()

    }
    
    func totalNumber(){
        total = repository.cartSummary()
    }
    
    func updatePriceSummary(){
        totalPrice = repository.priceSummary()
    }

}
