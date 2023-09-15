//
//  HotelButtonBlueUI.swift
//  Gold-Resort
//
//  Created by Илья Курлович on 14.09.2023.
//

import SwiftUI

struct HotelButtonBlueUI: View {
    @State var text: String
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(Color("HotelButtonBlue"))
                .frame(width: 350, height: 50, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            Text(text)
                .font(.headline)
                .foregroundStyle(.white)
        }
    }
}
