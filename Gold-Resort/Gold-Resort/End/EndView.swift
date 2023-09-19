//
//  EndView.swift
//  Gold-Resort
//
//  Created by Илья Курлович on 17.09.2023.
//

import SwiftUI

struct EndView: View {
    @State private var randomNumber: Int = Int.random(in: 104893...106534)
    
    var body: some View {
        ZStack {
            VStack(spacing: 30) {
                ZStack {
                    Circle()
                        .foregroundStyle(.thinMaterial)
                        .frame(width: 120, alignment: .center)
                    Text("🎉")
                        .font(.custom("Gift", fixedSize: 60))
                }
                
                Text("Ваш заказ принят в работу")
                    .font(.title2)
                
                Text("Подтверждение заказа №\(String(randomNumber)) может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
            }
            .padding()
            
            VStack {
                Spacer()
                NavigationLink {
                    ContentView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HotelButtonBlueUI(text: "Супер!")
                }
            }
        }
        .navigationTitle("Заказ оплачен")
    }
}

struct EndView_Previews: PreviewProvider {
    static var previews: some View {
        EndView()
            .environmentObject(PersonVM())
            .environmentObject(HotelViewModel())
    }
}
