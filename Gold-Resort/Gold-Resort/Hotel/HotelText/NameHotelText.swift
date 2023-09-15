//
//  NameHotelView.swift
//  Gold-Resort
//
//  Created by Илья Курлович on 13.09.2023.
//

import SwiftUI

struct NameHotelText: View {
    @State var nameHotel: String
    
    var body: some View {
        HStack {
            Text(nameHotel)
                .font(.custom("22", size: 22))
                .padding(.horizontal)
            Spacer()
        }
    }
}
