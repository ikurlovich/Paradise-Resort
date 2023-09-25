//
//  OrderView.swift
//  Gold-Resort
//
//  Created by Илья Курлович on 16.09.2023.
//

import SwiftUI
import Combine

struct OrderView: View {
    @StateObject private var vm = OrderViewModel()
    @EnvironmentObject private var vmPerson: PersonVM
    
    @State private var showNoInternetMessage = false
    @State private var isCheckEnd = false
    @State private var isShowError = false
    
    @State private var numberPersons = ["Второй"]
    @State private var numberPersonsArray = ["Третий", "Четвертый", "Пятый", "Шестой", "Седьмой", "Восьмой", "Девятый", "Десятый", "Одиннадцатый", "Двенадцатый", "Тринадцатый", "Четырнадцатый", "Пятнадцатый", "Шестнадцатый", "Семнадцатый", "Восемнадцатый", "Девятнадцатый", "Двадцатый"]
    
    
    var body: some View {
        if let order = vm.order {
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
                                    WhatStarsUI(stars: order.horating, comment: order.rating_name)
                                    NameHotelText(nameHotel: order.hotel_name)
                                    AddressHotelUI(address: order.hotel_adress)
                                }
                                .padding(.vertical)
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            
                            OrderBlockUI()
                            ContactsInfoBlockUI()
                            FirstPersonUI()
                            ForEach(numberPersons, id: \.self) { name in
                                SecondPersonUI(namePerson: name)
                            }
                            
                            ZStack {
                                Color("HotelBlockBackground")
                                VStack() {
                                    HStack {
                                        NameHotelText(nameHotel: "Добавить туриста")
                                        Image("PlusBlue")
                                            .padding(.horizontal)
                                            .onTapGesture {
                                                addMorePersons()
                                            }
                                    }
                                }
                                .padding(.vertical)
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            
                            AmountBlockUI()
                            
                            Spacer()
                                .frame(height: 10)
                        }
                    }
                    
                    NavigationLink {
                        EndView()
                    } label: {
                        if !vmPerson.isOnEnd() {
                            HotelButtonBlueUI(text: "Оплатить \(amountPrice().formatted()) ₽")
                        } else {
                            HotelButtonBlueUI(text: "Оплатить \(amountPrice().formatted()) ₽")
                                .onTapGesture {
                                    isCheckEnd.toggle()
                                    vmPerson.isFinePerson()
                                    isShowError.toggle()
                                }
                        }
                    }
                    
                }
            }
            .alert("Ошибка оплаты!", isPresented: $isShowError) {
                Button("OK", role: .cancel) { }
            } message: {
                Text("Пожалуйста, заполните все пустые поля.")
            }
            .navigationTitle("Бронирование")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.visible, for: .navigationBar)
        } else if showNoInternetMessage {
            DoglossUI(message: "")
        } else {
            DogWaitingUI()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        if vm.order == nil {
                            showNoInternetMessage = true
                        }
                    }
                }
        }
    }
    
    func addMorePersons() {
        if !numberPersonsArray.isEmpty {
            numberPersons.append(numberPersonsArray[0])
            numberPersonsArray.remove(at: 0)
        }
    }
    
    func amountPrice() -> Int {
        let result = (vm.order?.service_charge ?? 0) + (vm.order?.fuel_charge ?? 0) + (vm.order?.tour_price ?? 0)
        return result
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            OrderView()
        }
        .environmentObject(PersonVM())
        .environmentObject(HotelViewModel())
    }
}
