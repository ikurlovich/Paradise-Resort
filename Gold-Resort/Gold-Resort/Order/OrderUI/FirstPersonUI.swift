//
//  FirstPersonUI.swift
//  Gold-Resort
//
//  Created by Илья Курлович on 17.09.2023.
//

import SwiftUI

struct FirstPersonUI: View {
    @EnvironmentObject private var vm: PersonVM
    @State private var redColor = Color(UIColor(red: 235/255, green: 87/255, blue: 87/255, alpha: 0.15))
    
    var body: some View {
        ZStack {
            Color("HotelBlockBackground")
            VStack {
                VStack() {
                    HStack {
                        NameHotelText(nameHotel: "Первый турист")
                        (vm.isShowFirst ? Image("Up") : Image("Down"))
                            .padding(.horizontal)
                            .onTapGesture {
                                vm.isShowFirst.toggle()
                            }
                            .animation(.default, value: vm.isShowFirst)
                    }
                }
                .padding(.vertical)
                
                if vm.isShowFirst {
                    VStack {
                            TextField("Имя", text: $vm.name)
                            .padding()
                            .background(vm.isName ? redColor : .clear)
                            .background(Material.thin)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                            TextField("Фамилия", text: $vm.soName)
                            .padding()
                            .background(vm.isSoName ? redColor : .clear)
                            .background(Material.thin)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                            TextField("Дата рождения", text: $vm.dateOfBirth)
                            .keyboardType(.numberPad)
                            .padding()
                            .background(vm.isDateOfBirth ? redColor : .clear)
                            .background(Material.thin)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                            TextField("Гражданство", text: $vm.citizenship)
                            .padding()
                            .background(vm.isCitizenship ? redColor : .clear)
                            .background(Material.thin)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                            TextField("Номер загранпаспорта", text: $vm.passportNumber)
                            .keyboardType(.numberPad)
                            .padding()
                            .background(vm.isPassportNumber ? redColor : .clear)
                            .background(Material.thin)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                            TextField("Срок действия загранпаспорта", text:
                                        $vm.term)
                            .keyboardType(.numberPad)
                            .padding()
                            .background(vm.isTerm ? redColor : .clear)
                            .background(Material.thin)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                }
            }
            .animation(.default, value: vm.isShowFirst)
        }
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct FirstPersonUI_Previews: PreviewProvider {
    static var previews: some View {
        FirstPersonUI()
            .environmentObject(PersonVM())
    }
}
