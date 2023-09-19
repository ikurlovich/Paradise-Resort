//
//  RoomsView.swift
//  Gold-Resort
//
//  Created by Илья Курлович on 14.09.2023.
//

import SwiftUI

struct RoomsView: View {
    @StateObject private var vm = RoomsViewModel()
    @State private var showNoInternetMessage = false
    @EnvironmentObject var vmH: HotelViewModel
    
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
                                        SliderImagesRoomsUI(quantityImages: rooms[index].image_urls.count, nameImages: rooms[index].image_urls)
                                        NameHotelText(nameHotel: rooms[index].name)
                                        PeculiaritiesUI(about: rooms[index].peculiarities)
                                        RoomsButtonBlueUI()
                                        PriceHotelText(price: rooms[index].price, namePrice: rooms[index].price_per)
                                        NavigationLink {
                                            OrderView()
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
                .navigationTitle(vmH.hotel?.name ?? "")
                .navigationBarTitleDisplayMode(.inline)
                .toolbarBackground(.visible, for: .navigationBar)
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
        .environmentObject(PersonVM())
        .environmentObject(HotelViewModel())
    }
}
