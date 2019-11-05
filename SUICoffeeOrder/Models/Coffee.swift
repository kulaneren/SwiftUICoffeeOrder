//
//  Coffee.swift
//  SUICoffeeOrder
//
//  Created by eren kulan on 03/11/2019.
//  Copyright © 2019 eren kulan. All rights reserved.
//

import Foundation

struct Coffee {
    
    let name: String
    let imgUrl: String
    let price: Double
}

extension Coffee {
    
    static func all() -> [Coffee] {
        return [
            Coffee(name: "Cappucino", imgUrl: "latte", price: 2.50),
            Coffee(name: "Espresso", imgUrl: "latte", price: 1.80),
            Coffee(name: "Latte", imgUrl: "latte", price: 2.50)
        ]
    }
}
