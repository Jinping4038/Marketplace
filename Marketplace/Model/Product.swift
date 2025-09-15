//
//  ProductData.swift
//  Marketplace
//
//  Created by Jin Zhang on 8/25/25.
//

import Foundation

struct Product: Identifiable, Priceable{
    var id: Int
    var name: String
    var category: ProductCategory
    var price: Double
    var discount: PriceRule
}

enum ProductCategory: String{

    case HomeProducts
    case Electronics
    case Grocery
    case Aptocoparel
}

enum PriceRule{
    case Flat(Double)
    case Percent(Double)
}


protocol Priceable{
    var price: Double { get }
}

protocol Discountable: Priceable{
    
}
