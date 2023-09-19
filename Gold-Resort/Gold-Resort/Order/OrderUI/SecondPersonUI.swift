//
//  SecondPersonUI.swift
//  Gold-Resort
//
//  Created by Илья Курлович on 19.09.2023.
//

import SwiftUI

struct SecondPersonUI: View {
    @StateObject private var vm = PersonVM()
    @State private var redColor = Color(UIColor(red: 235/255, green: 87/255, blue: 87/255, alpha: 0.15))
    
    @State var namePerson: String
    
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
                            .onChange(of: vm.dateOfBirth) { newValue in
                                vm.dateOfBirth = formattedDate(date: newValue)
                            }
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
                            .onChange(of: vm.passportNumber) { newValue in
                                vm.passportNumber = formattedPassportNumber(number: newValue)
                            }
                            .keyboardType(.numberPad)
                            .padding()
                            .background(vm.isPassportNumber ? redColor : .clear)
                            .background(Material.thin)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                            TextField("Срок действия загранпаспорта", text:
                                        $vm.term)
                            .onChange(of: vm.term) { newValue in
                                vm.term = formattedDate(date: newValue)
                            }
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
    
    func formattedPassportNumber(number: String) -> String {
        let cleanNumber = number.components(separatedBy: CharacterSet.alphanumerics.inverted).joined().uppercased()
        
        if cleanNumber.isEmpty {
            return ""
        }
        
        let mask = "  -       "
        var result = ""
        var index = cleanNumber.startIndex
        for ch in mask {
            if ch == " " {
                if index < cleanNumber.endIndex {
                    result.append(cleanNumber[index])
                    index = cleanNumber.index(after: index)
                }
            } else {
                result.append(ch)
            }
        }
        return result
    }

    
    func formattedDate(date: String) -> String {
        let cleanDate = date.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        
        if cleanDate.isEmpty {
            return ""
        }
        
        let mask = "  .  .    "
        var result = ""
        var index = cleanDate.startIndex
        for ch in mask {
            if ch == " " {
                if index < cleanDate.endIndex {
                    result.append(cleanDate[index])
                    index = cleanDate.index(after: index)
                }
            } else {
                result.append(ch)
            }
        }
        return result
    }

}

struct SecondPersonUI_Previews: PreviewProvider {
    static var previews: some View {
        SecondPersonUI(namePerson: "Второй турист")
            .environmentObject(PersonVM())
    }
}
