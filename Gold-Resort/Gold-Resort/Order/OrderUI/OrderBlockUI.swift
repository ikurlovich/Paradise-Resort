//
//  OrderBlockUI.swift
//  Gold-Resort
//
//  Created by Илья Курлович on 16.09.2023.
//

import SwiftUI

struct OrderBlockUI: View {
    @StateObject private var vm = OrderViewModel()
    var body: some View {
        if let order = vm.order {
            ZStack {
                Color("HotelBlockBackground")
                
                HStack {
                    Grid(alignment: .topLeading, horizontalSpacing: 20, verticalSpacing: 20) {
                        GridRow(alignment: .top) {
                            Text("Вылет из")
                                .foregroundStyle(.gray)
                            Text(order.departure)
                        }
                        
                        GridRow(alignment: .top) {
                            Text("Страна, город")
                                .foregroundStyle(.gray)
                            Text(order.arrival_country)
                        }
                        
                        GridRow(alignment: .top) {
                            Text("Даты")
                                .foregroundStyle(.gray)
                            Text("\(order.tour_date_start)-\(order.tour_date_stop) ")
                        }
                        
                        GridRow(alignment: .top) {
                            Text("Кол-во ночей")
                                .foregroundStyle(.gray)
                            Text("\(order.number_of_nights)")
                        }
                        
                        GridRow(alignment: .top) {
                            Text("Отель")
                                .foregroundStyle(.gray)
                            Text(order.hotel_name)
                        }
                        
                        GridRow(alignment: .top) {
                            Text("Номер")
                                .foregroundStyle(.gray)
                            Text(order.room)
                        }
                        
                        GridRow(alignment: .top) {
                            Text("Питание")
                                .foregroundStyle(.gray)
                            Text(order.nutrition)
                        }
                        
                    }
                    .padding()
                    Spacer()
                }
                
            }
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }
}

struct OrderBlockUI_Previews: PreviewProvider {
    static var previews: some View {
        OrderBlockUI()
    }
}
