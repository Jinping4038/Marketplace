//
//  Untitled.swift
//  Marketplace
//
//  Created by Jin Zhang on 8/26/25.
//

import Foundation

enum MarketError: Error{
    case productNotFound
    case invalidQty
    case outOfStock
}

extension MarketError{
    var description: String {
        switch self{
        case .productNotFound:
            return "ProductNotFound"
        case .invalidQty:
            return "InvalidQty"
        case .outOfStock:
            return "OutOfStock"
        }
    }
}


