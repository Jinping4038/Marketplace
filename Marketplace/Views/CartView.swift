//
//  CartView.swift
//  Marketplace
//
//  Created by Jin Zhang on 8/25/25.
//

import SwiftUI

struct CartView: View {
    @StateObject var cartViewModel = CartViewModel(repository: FakeProductRepositoryImpl(fakeDatabase: FakeDatabase.instance))
    
//If you didn’t use the singleton and instead created a new FakeDatabase() each time:
    
//    ContentView and CartView would each get different databases.
//
//    Adding an item to cart in one place wouldn’t update the other → ❌ inconsistent state.
    
    var body: some View {
        
            VStack{
                List(cartViewModel.cartItems, id:\.product.id){item in
                    HStack{
                        Text("\(item.product.name)\nQuantity: \(item.quantity)\n Price\(item.product.price)\n\(item.product.price  * Double(item.quantity))")
                            .font(.title)
                        
                        Button("Reduce"){
                            cartViewModel.reduceFromCart(id: item.product.id)
                        }
                        .buttonStyle(.borderedProminent)
                        
                        Button("Add"){
                            cartViewModel.addToCart(id: item.product.id)
                        }
                        .buttonStyle(.borderedProminent)
                    }
                }
                HStack{
                    Text("Total Quantity:")
                    Text("\(cartViewModel.total)")
                }
                .font(.title)
                HStack{
                    Text("Total Price:")
                    Text("\(cartViewModel.totalPrice)")
                }
                .font(.title)
            }
    }
}

#Preview {
    CartView()
}
