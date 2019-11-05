//
//  Order.swift
//  SUICoffeeOrder
//
//  Created by eren kulan on 03/11/2019.
//  Copyright © 2019 eren kulan. All rights reserved.
//

import Foundation

struct Order: Codable {
    
    let name: String
    let size: String
    let coffeeName: String
    let total: Double
}
