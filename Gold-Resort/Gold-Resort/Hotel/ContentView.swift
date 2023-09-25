import SwiftUI

struct ContentView: View {
    @StateObject private var vm = HotelViewModel()

    var body: some View {
        NavigationView {
            switch vm.state {
            case .loading:
                DogWaitingUI()

            case .success:
                contentView

            case .error(let error):
                DoglossUI(message: error.localizedDescription)
            }
        }
        .onAppear(perform: {
            vm.load()
        })
    }

    private var contentView: some View {
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
                            Group1(hotel: vm.hotel!)
                                .padding(.vertical)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 20))

                        ZStack {
                            Color("HotelBlockBackground")

                            VStack() {
                                AboutHotelText()
                                PeculiaritiesUI(about: vm.hotel!.about_the_hotel.peculiarities)
                                DescriptionHotelText(description: vm.hotel!.about_the_hotel.description)
                                DescriptionBlockUI()
                            }
                            .padding(.vertical)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                }
                NavigationLink {
                    RoomsView(hotelName: vm.hotel?.name ?? "")
                } label: {
                    HotelButtonBlueUI(text: "К выбору номера")
                }
            }
        }
        .navigationTitle("Отель")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(HotelViewModel())
            .environmentObject(PersonVM())
    }
}

struct Group1: View {
    var hotel: HotelInfo

    var body: some View {
        VStack(spacing: 10) {
            SliderImagesUI(quantityImages: hotel.image_urls.count, nameImages: hotel.image_urls)
            WhatStarsUI(stars: hotel.rating, comment: hotel.rating_name)
            NameHotelText(nameHotel: hotel.name)
            AddressHotelUI(address: hotel.adress)
            PriceHotelText(price: hotel.minimal_price, namePrice: hotel.price_for_it)
        }
        .padding(.vertical)
    }
}
