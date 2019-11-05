//
//  AddCoffeeOrderView.swift
//  SUICoffeeOrder
//
//  Created by eren kulan on 05/11/2019.
//  Copyright © 2019 eren kulan. All rights reserved.
//

import SwiftUI

struct AddCoffeeOrderView: View {
    
    @Binding var isPresented: Bool
    
    @ObservedObject private var addCoffeeOrderVM = AddCoffeeOrderViewModel()
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                Form {
                    
                    Section(header: Text("INFORMATION").font(.body)) {
                        TextField("Add Name", text: self.$addCoffeeOrderVM.name)
                    }
                    
                    Section(header: Text("SELECT COFFEE").font(.body)) {
                        
                        ForEach(addCoffeeOrderVM.coffeeList, id:\.name) { coffee in
                            CoffeeCellView(coffee: coffee, selection: self.$addCoffeeOrderVM.coffeeName)
                        }
                    }
                    
                    Section(header: Text("SELECT SIZE").font(.body), footer: OrderTotalView(total: self.addCoffeeOrderVM.total)) {
                        Picker("", selection: self.$addCoffeeOrderVM.size) {
                            Text("Small").tag("Small")
                            Text("Medium").tag("Medium")
                            Text("Large").tag("Large")
                        }.pickerStyle(SegmentedPickerStyle())
                    }
                }
                HStack {
                    Button("Place Order") {
                        self.addCoffeeOrderVM.placeOrder()
                        self.isPresented = false
                    }
                }.padding(EdgeInsets(top: 12, leading: 100, bottom: 12, trailing: 100))
                    .foregroundColor(Color.white)
                    .background(Color.green)
                    .cornerRadius(10)
            }
            
            .navigationBarTitle("Add Order")
        }
    }
}

struct AddCoffeeOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddCoffeeOrderView(isPresented: .constant(false))
    }
}

struct CoffeeCellView: View {
    
    let coffee: CoffeeViewModel
    
    @Binding var selection: String
    
    var body: some View {
        HStack {
            Image(coffee.imageURL)
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
                .cornerRadius(16)
            Text(coffee.name)
                .font(.title)
                .padding([.leading], 20)
            Spacer()
            Image(systemName: self.selection == self.coffee.name ? "checkmark": "").padding()
        }.onTapGesture {
            self.selection = self.coffee.name
        }
    }
}
