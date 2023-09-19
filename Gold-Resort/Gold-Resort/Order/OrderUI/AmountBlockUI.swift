//
//  AmountBlockUI.swift
//  Gold-Resort
//
//  Created by Илья Курлович on 17.09.2023.
//

import SwiftUI

struct AmountBlockUI: View {
    @StateObject private var vm = OrderViewModel()
    var body: some View {
        if let order = vm.order {
            ZStack {
                Color("HotelBlockBackground")
                
                HStack {
                    Grid(alignment: .topLeading, verticalSpacing: 20) {
                        HStack {
                            Text("Тур")
                                .foregroundStyle(.gray)
                            Spacer()
                            Text("\(order.tour_price) ₽")
                        }
                        
                        HStack {
                            Text("Топливный сбор")
                                .foregroundStyle(.gray)
                            Spacer()
                            Text("\(order.fuel_charge) ₽")
                        }
                        
                        HStack {
                            Text("Сервисный сбор")
                                .foregroundStyle(.gray)
                            Spacer()
                            Text("\(order.service_charge) ₽")
                        }
                        
                        HStack {
                            Text("К оплате")
                                .foregroundStyle(.gray)
                            Spacer()
                            Text("\(amountPrice().formatted()) ₽")
                        }
                    }
                    .padding()
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }
    
    func amountPrice() -> Int {
        let result = (vm.order?.service_charge ?? 0) + (vm.order?.fuel_charge ?? 0) + (vm.order?.tour_price ?? 0)
        return result
    }
}

struct AmountBlockUI_Previews: PreviewProvider {
    static var previews: some View {
        AmountBlockUI()
    }
}
