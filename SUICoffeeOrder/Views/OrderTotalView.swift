//
//  OrderTotalView.swift
//  SUICoffeeOrder
//
//  Created by eren kulan on 05/11/2019.
//  Copyright © 2019 eren kulan. All rights reserved.
//

import SwiftUI

struct OrderTotalView: View {
    
    let total: Double
    
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            Text(String.init(format: "$%.f", self.total)).font(.title)
                .foregroundColor(Color.green)
            Spacer()
        }.padding(10)
    }
}

struct OrderTotalView_Previews: PreviewProvider {
    static var previews: some View {
        OrderTotalView(total: 22.45)
    }
}
