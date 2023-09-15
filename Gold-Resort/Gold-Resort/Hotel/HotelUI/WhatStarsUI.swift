//
//  WhatStarsView.swift
//  Gold-Resort
//
//  Created by Илья Курлович on 13.09.2023.
//

import SwiftUI

struct WhatStarsUI: View {
    @State var stars: Int
    @State var comment: String
    var body: some View {
        ZStack {
            HStack {
                HStack {
                    Image(systemName: "star.fill")
                    Text("\(stars) \(comment)")
                }
                .foregroundStyle(Color("HotelText"))
                .padding(6)
                .background(Color("HotelBackground"))
                .clipShape(RoundedRectangle(cornerRadius: 5))
                Spacer()
            }
            .padding(.horizontal)
        }
    }
}

