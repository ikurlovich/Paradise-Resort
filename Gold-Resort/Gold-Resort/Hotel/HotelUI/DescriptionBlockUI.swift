//
//  DescriptionBlockUI.swift
//  Gold-Resort
//
//  Created by Илья Курлович on 14.09.2023.
//

import SwiftUI

struct DescriptionBlockUI: View {
    var body: some View {
        ZStack {
            Color("HotelLastBackground")
            
            VStack {
                HStack {
                    Image("Frame5")
                    Spacer()
                        .frame(width: 15)
                    VStack(alignment: .leading) {
                        Text("Удобства")
                            .font(.headline)
                        Text("Самое необходимое")
                            .foregroundStyle(.gray)
                    }
                    Spacer()
                    Image("Frame8")
                    Spacer()
                        .frame(width: 15)
                }
                
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.gray)

                
                HStack {
                    Image("Frame6")
                    Spacer()
                        .frame(width: 15)
                    VStack(alignment: .leading) {
                        Text("Что включено")
                            .font(.headline)
                        Text("Самое необходимое")
                            .foregroundStyle(.gray)
                    }
                    Spacer()
                    Image("Frame8")
                    Spacer()
                        .frame(width: 15)
                }
                
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.gray)

                
                HStack {
                    Image("Frame7")
                    Spacer()
                        .frame(width: 15)
                    VStack(alignment: .leading) {
                        Text("Что включено")
                            .font(.headline)
                        Text("Самое необходимое")
                            .foregroundStyle(.gray)
                    }
                    Spacer()
                    Image("Frame8")
                    Spacer()
                        .frame(width: 15)
                }
            }
            .padding()
        }
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding()
    }
}
