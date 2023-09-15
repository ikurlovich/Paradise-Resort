//
//  AddressHotelView.swift
//  Gold-Resort
//
//  Created by Илья Курлович on 13.09.2023.
//

import SwiftUI

struct AddressHotelUI: View {
    @State var address: String
    
    var body: some View {
        HStack {
            Button {
               // none action
            } label: {
                Text(address)
                    .font(.footnote)
                Spacer()
            }
        }
        .padding(.horizontal)
    }
}
