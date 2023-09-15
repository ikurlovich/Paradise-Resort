//
//  DogWaitingUI.swift
//  Gold-Resort
//
//  Created by Илья Курлович on 14.09.2023.
//

import SwiftUI

struct DogWaitingUI: View {
    var body: some View {
        VStack {
            Image("DogWaiting")
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
            Text("Загрузка...")
        }
    }
}
