//
//  RoomsView.swift
//  Gold-Resort
//
//  Created by Илья Курлович on 14.09.2023.
//

import SwiftUI
import WaterfallGrid

struct RoomsView: View {
    @StateObject private var vm = RoomsViewModel()
    @State private var showNoInternetMessage = false
    
    
    var body: some View {
            if let rooms = vm.rooms?.rooms {
                ZStack {
                    Color("HotelMainBackground")
                        .ignoresSafeArea()

                    ScrollView {
                        VStack {
                            Spacer()
                                .frame(height: 10)
                            
                            ForEach(0..<rooms.count, id: \.self){ index in
                                ZStack {
                                    Color("HotelBlockBackground")
                                    
                                    VStack {
                                        SliderImagesUI(quantityImages: rooms[index].image_urls.count, nameImages: rooms[index].image_urls)
                                        NameHotelText(nameHotel: rooms[index].name)
                                        PeculiaritiesUI(about: rooms[index].peculiarities)
                                        RoomsButtonBlueUI()
                                        PriceHotelText(price: rooms[index].price, namePrice: rooms[index].price_per)
                                        NavigationLink {
                                            Text("Test")
                                                .toolbar {
                                                    ToolbarItem(placement: .principal) {
                                                        Text("Бронирование")
                                                            .multilineTextAlignment(.center)
                                                            .font(.headline)
                                                    }
                                                }
                                                .toolbarBackground(.visible, for: .navigationBar)
                                        } label: {
                                            HotelButtonBlueUI(text: "Выбрать номер")
                                        }
                                    }
                                    .padding(.vertical)
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                            }
                        }
                    }
                }
            } else if showNoInternetMessage {
                DoglossUI()
            } else {
                DogWaitingUI()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                            if vm.rooms == nil {
                                showNoInternetMessage = true
                            }
                        }
                    
            }
            
        }
    }
}

struct RoomsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RoomsView()
        }
    }
}
