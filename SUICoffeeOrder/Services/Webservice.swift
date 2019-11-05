//
//  Webservice.swift
//  SUICoffeeOrder
//
//  Created by eren kulan on 03/11/2019.
//  Copyright © 2019 eren kulan. All rights reserved.
//

import Foundation

class Webservice {
    
    func getAllOrders(completion: @escaping ([Order]?) -> ()) {
        
        guard let url = URL(string: "https://charm-gerbil.glitch.me/orders") else {
            DispatchQueue.main.async {
                completion(nil)
            }
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let orders = try? JSONDecoder().decode([Order].self, from: data)
            DispatchQueue.main.async {
                completion(orders)
            }
            
        }.resume()
    }
    
    func createCoffeeOrder(order: Order, completion: @escaping (CreateOrderResponse?) -> ()) {
        guard let url = URL(string: "https://charm-gerbil.glitch.me/orders") else {
            return
        }
        
        var request = URLRequest.init(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(order)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let createOrderResponse = try? JSONDecoder().decode(CreateOrderResponse.self, from: data)
            DispatchQueue.main.async {
                completion(createOrderResponse)
            }
            
        }.resume()
    }
}
