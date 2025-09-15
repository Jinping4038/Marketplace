//
//  HomePageViewModel.swift
//  Marketplace
//
//  Created by Jin Zhang on 8/25/25.
//

import Foundation

class HomePageViewModel: ObservableObject{
    @Published var products: [Product] = []
    
    //private var repository = FakeProductRepositoryImpl(fakeDatabase: FakeDatabase())
    private var repository: ProductRepository
    
    init(repository: ProductRepository) {
        self.repository = repository
        updateProducts()
    }
    func updateProducts(){
        products = repository.getProducts()
    }
    
    func addToCart(id: Int){
        do {
            try repository.addItemQuantity(id: id)
        } catch let error as MarketError {
            print("Error: \(error.description)")
        } catch {
            print("Error: \(error.localizedDescription)")
        }
        
    }
    
    
    func filteredProducts(searchText: String) {
        if searchText.isEmpty{
            products = repository.getProducts()
        } else {
            products = repository.getProducts().filter{ product in product.name.contains(searchText) ||  String(describing: product.category).contains(searchText)}
        }
        
    }
    
}
