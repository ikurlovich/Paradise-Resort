//
//  PriceHotelView.swift
//  Gold-Resort
//
//  Created by Илья Курлович on 13.09.2023.
//

import SwiftUI

struct PriceHotelText: View {
    @State var price: Int
    @State var namePrice: String
    
    var body: some View {
        HStack(alignment: .bottom) {
            Text("от \(price) ₽")
                .fixedSize(horizontal: true, vertical: true)
                .font(.title)
            Text(namePrice.lowercased())
                .fixedSize(horizontal: true, vertical: true)
                .font(.callout)
                .foregroundStyle(.secondary)
            Spacer()
        }
        .padding(.horizontal)
    }
}

