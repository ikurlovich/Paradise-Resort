//
//  SliderImagesRoomsUI.swift
//  Gold-Resort
//
//  Created by Илья Курлович on 19.09.2023.
//

import SwiftUI

struct SliderImagesRoomsUI: View {
    @State var quantityImages: Int
    @State var nameImages: [String]
    
    @State private var currentIndex = 0
    var body: some View {
        TabView(){
            ForEach(0..<quantityImages, id: \.self){ num in
                AsyncImage(url: URL(string: nameImages[num])) { phase in
                    switch phase {
                    case .success(let image):
                        image.resizable()
                            .scaledToFill()
                            .overlay(Color.black.opacity(0.1))
                    case .failure:
                        Image("Hotel1")
                            .resizable()
                            .scaledToFill()
                            .overlay(Color.black.opacity(0.1))
                    default:
                        ProgressView()
                    }
                }
                .tag(num)
            }
        }
        .frame(width: 370, height: 300, alignment: .center)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .tabViewStyle(PageTabViewStyle())

    }
}
