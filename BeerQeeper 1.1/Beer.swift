//
//  Beer.swift
//  BeerQeeper 1.1
//
//  Created by Apple on 3.11.25.
//

enum BeerEnum {
    static let heiniken = "Heiniken"
    static let guiness = "Guiness"
    static let tuborg = "Tuborg"
}

enum BeerQuantity {
    static let oneHudred = 100
    static let fifty = 50
    static let probe = 10
}

final class Beer {
    let mark: String
    var quantity: Int
    var price: Double
    
    init(mark: String, quantity: Int, price: Double) {
        self.mark = mark
        self.quantity = quantity
        self.price = price
    }
}
