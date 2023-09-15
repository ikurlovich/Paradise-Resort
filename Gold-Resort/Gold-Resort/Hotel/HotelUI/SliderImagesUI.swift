//
//  SliderImagesView.swift
//  Gold-Resort
//
//  Created by Илья Курлович on 13.09.2023.
//

import SwiftUI

struct SliderImagesUI: View {
    @State var quantityImages: Int
    @State var nameImages: [String]
    
    private let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    
    @State private var currentIndex = 0
    var body: some View {
        TabView(selection: $currentIndex){
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
        .onReceive(timer, perform: {_ in
            withAnimation{
                currentIndex = currentIndex < (quantityImages - 1) ? currentIndex + 1 : 0
            }
        })
    }
}


