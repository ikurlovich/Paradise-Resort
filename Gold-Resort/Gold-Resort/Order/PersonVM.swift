//
//  PersonVM.swift
//  Gold-Resort
//
//  Created by Илья Курлович on 17.09.2023.
//

import Foundation

class PersonVM: ObservableObject {
    
    // Persons block
    
    @Published var name = ""
    @Published var soName = ""
    @Published var dateOfBirth = ""
    @Published var citizenship = ""
    @Published var passportNumber = ""
    @Published var term = ""
    
    @Published var isName = false
    @Published var isSoName = false
    @Published var isDateOfBirth = false
    @Published var isCitizenship = false
    @Published var isPassportNumber = false
    @Published var isTerm = false
    
    @Published var isShowFirst = true
    
    // Email and phone number block
    
    @Published var email = ""
    @Published var phoneNumber = ""
    
    @Published var isEmail = false
    @Published var isPhoneNumber = false
    
    @Published var isValid = false
    @Published var didStartEditing = false
    
    // functions
    
    func isFinePerson() {
        name.isEmpty ? (isName = true) : (isName = false)
        soName.isEmpty ? (isSoName = true) : (isSoName = false)
        dateOfBirth.isEmpty ? (isDateOfBirth = true) : (isDateOfBirth = false)
        citizenship.isEmpty ? (isCitizenship = true) : (isCitizenship = false)
        passportNumber.isEmpty ? (isPassportNumber = true) : (isPassportNumber = false)
        term.isEmpty ? (isTerm = true) : (isTerm = false)
        email.isEmpty || !isValid ? (isEmail = true) : (isEmail = false)
        phoneNumber.isEmpty ? (isPhoneNumber = true) : (isPhoneNumber = false)
    }
    
    func isOnEnd() -> Bool {
        if name.isEmpty || soName.isEmpty || dateOfBirth.isEmpty || citizenship.isEmpty || passportNumber.isEmpty || term.isEmpty || email.isEmpty || phoneNumber.isEmpty || !isValid {
            
            return true
        }

        return false
    }
}

