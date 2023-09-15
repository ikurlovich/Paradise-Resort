//
//  DescriptionHotelText.swift
//  Gold-Resort
//
//  Created by Илья Курлович on 14.09.2023.
//

import SwiftUI

struct DescriptionHotelText: View {
    @State var description: String
    var body: some View {
        Text(description)
        .fixedSize(horizontal: false, vertical: true)
        .padding()
    }
}
