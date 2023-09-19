import SwiftUI

struct ContentView: View {
    @StateObject private var vm = HotelViewModel()
    @State private var showNoInternetMessage = false
    
    
    var body: some View {
        NavigationView {
            if let hotel = vm.hotel {
                ZStack {
                    Color("HotelMainBackground")
                        .ignoresSafeArea()
                    
                    VStack {
                        ScrollView {
                            VStack {
                                Spacer()
                                    .frame(height: 10)
                                
                                ZStack {
                                    Color("HotelBlockBackground")
                                    
                                    VStack(spacing: 10) {
                                        SliderImagesUI(quantityImages: hotel.image_urls.count, nameImages: hotel.image_urls)
                                        WhatStarsUI(stars: hotel.rating, comment: hotel.rating_name)
                                        NameHotelText(nameHotel: hotel.name)
                                        AddressHotelUI(address: hotel.adress)
                                        PriceHotelText(price: hotel.minimal_price, namePrice: hotel.price_for_it)
                                    }
                                    .padding(.vertical)
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                
                                ZStack {
                                    Color("HotelBlockBackground")
                                    
                                    VStack() {
                                        AboutHotelText()
                                        PeculiaritiesUI(about: hotel.about_the_hotel.peculiarities)
                                        DescriptionHotelText(description: hotel.about_the_hotel.description)
                                        DescriptionBlockUI()
                                    }
                                    .padding(.vertical)
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                            }
                        }
                        NavigationLink {
                            RoomsView()
                        } label: {
                            HotelButtonBlueUI(text: "К выбору номера")
                        }
                    }
                }
                .navigationTitle("Отель")
                .navigationBarTitleDisplayMode(.inline)
                .toolbarBackground(.visible, for: .navigationBar)
            } else if showNoInternetMessage {
                DoglossUI()
            } else {
                DogWaitingUI()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                            if vm.hotel == nil {
                                showNoInternetMessage = true
                            }
                        }
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(HotelViewModel())
            .environmentObject(PersonVM())
    }
}
