//
//  ContactsInfoBlocklUI.swift
//  Gold-Resort
//
//  Created by Илья Курлович on 17.09.2023.
//

import SwiftUI

struct ContactsInfoBlockUI: View {
    @EnvironmentObject private var vm: PersonVM
    @State private var redColor = Color(UIColor(red: 235/255, green: 87/255, blue: 87/255, alpha: 0.15))
    
    var body: some View {
        ZStack {
            Color("HotelBlockBackground")
            
            VStack(alignment: .leading,spacing: 1) {
                NameHotelText(nameHotel: "Информация о покупателе")
                
                VStack {
                    TextField("Номер телефона", text: $vm.phoneNumber)
                        .onChange(of: vm.phoneNumber) { newValue in
                            vm.phoneNumber = formattedNumber(number: newValue)
                        }
                        .keyboardType(.numberPad)
                        .padding()
                        .background(vm.isPhoneNumber ? redColor : .clear)
                        .background(Material.thin)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    TextField("Почта", text: $vm.email)
                        .keyboardType(.emailAddress)
                        .padding()
                        .background(vm.isEmail ? redColor : .clear)
                        .background(Material.thin)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .onChange(of: vm.email) { newValue in
                            vm.didStartEditing = true
                            vm.isValid = isValidEmail(newValue)
                        }
                    
                    if vm.didStartEditing && !vm.email.isEmpty {
                        if !vm.isValid {
                            Text("Некорректный или неполный Email")
                                .foregroundColor(.red)
                        }
                    }
                    
                    
                }
                .padding()
                
                VStack {
                    Text("Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту")
                        .foregroundStyle(.secondary)
                }
                .padding(.horizontal)
                
            }
            .padding(.vertical)
        }
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
    
    func formattedNumber(number: String) -> String {
        var cleanPhoneNumber = number.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        
        if cleanPhoneNumber.hasPrefix("7") || cleanPhoneNumber.hasPrefix("8") {
            cleanPhoneNumber = String(cleanPhoneNumber.dropFirst())
        }
        
        let mask = "+7 (***) ***-**-**"
        var result = ""
        var index = cleanPhoneNumber.startIndex
        for ch in mask {
            if ch == "*" {
                if index < cleanPhoneNumber.endIndex {
                    result.append(cleanPhoneNumber[index])
                    index = cleanPhoneNumber.index(after: index)
                } else {
                    result.append(ch)
                }
            } else {
                result.append(ch)
            }
        }
        return result
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let test = NSPredicate(format:"SELF MATCHES %@", regex)
        return test.evaluate(with: email)
    }
    
}

struct ContactsInfoBlockUI_Previews: PreviewProvider {
    static var previews: some View {
        ContactsInfoBlockUI()
            .environmentObject(PersonVM())
    }
}
