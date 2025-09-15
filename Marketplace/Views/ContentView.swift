//
//  ContentView.swift
//  Marketplace
//
//  Created by Jin Zhang on 8/25/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var homeViewModel: HomePageViewModel = HomePageViewModel(repository: FakeProductRepositoryImpl(fakeDatabase: FakeDatabase.instance))
    @State private var searchText = ""
    
//    @ObservedObject var cartViewModel: CartViewModel
    var body: some View {
        NavigationStack{
            VStack {
                List(homeViewModel.products, id: \.id){ item in
                    HStack{
                        Text("Id: \(item.id)\nName: \(item.name)\nCategory:\(item.category)\nPrice:\(item.price)")
                        Button("Add to Cart"){
                            homeViewModel.addToCart(id: item.id)
                        }.buttonStyle(.borderedProminent)
                        
                    }
                }
                NavigationLink("Go to Cart"){
                    CartView()
                }
            }
            .navigationTitle("Home")
        }
        .searchable(text: $searchText, prompt: "Search Items")
        .onChange(of: searchText) {
            homeViewModel.filteredProducts(searchText: searchText)
        }
        
    }
    
    
}

#Preview {
    ContentView()
}
