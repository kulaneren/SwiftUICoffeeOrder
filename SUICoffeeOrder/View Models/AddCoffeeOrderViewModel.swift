//
//  AddCoffeeOrderViewModel.swift
//  SUICoffeeOrder
//
//  Created by eren kulan on 05/11/2019.
//  Copyright © 2019 eren kulan. All rights reserved.
//

import Foundation

class AddCoffeeOrderViewModel: ObservableObject {
    
    var name: String = ""
    @Published var size: String = "Medium"
    @Published var coffeeName: String = "Medium"
    
    var coffeeList: [CoffeeViewModel] {
        return Coffee.all().map(CoffeeViewModel.init)
    }
    
    private var webService: Webservice
    
    init() {
        self.webService = Webservice()
    }
    
    var total: Double {
        return calculateTotalPrice()
    }
    
    func placeOrder() {
        let order = Order(name: self.name, size: self.size, coffeeName: self.coffeeName, total: self.total)
        self.webService.createCoffeeOrder(order: order) { _ in
                
        }
    }
    
    private func priceForSize() -> Double{
        let prices = ["Small":2.0, "Medium":3.0, "Large":4.0,]
        return prices[self.size]!
    }
    
    
    private func calculateTotalPrice() -> Double {
        let coffeeVM = coffeeList.first { $0.name == coffeeName }
        if let coffeeVM = coffeeVM {
            return coffeeVM.price * priceForSize()
        }else {
            return 0.0
        }
    }
}
