//
//  CoffeeViewModel.swift
//  SUICoffeeOrder
//
//  Created by eren kulan on 05/11/2019.
//  Copyright © 2019 eren kulan. All rights reserved.
//

import Foundation

class CoffeeListViewModel {
    var coffeeList: [CoffeeViewModel] = [CoffeeViewModel]()
}

struct CoffeeViewModel {
    
    var coffee: Coffee
    
    init(coffee: Coffee) {
        self.coffee = coffee
    }
    
    var name: String {
        return self.coffee.name
    }
    
    var imageURL: String {
        return self.coffee.imgUrl
    }
    
    var price: Double {
        return self.coffee.price
    }
}
