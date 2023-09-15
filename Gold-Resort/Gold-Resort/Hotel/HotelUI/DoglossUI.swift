//
//  DoglossUI.swift
//  Gold-Resort
//
//  Created by Илья Курлович on 14.09.2023.
//

import SwiftUI

struct DoglossUI: View {
    var body: some View {
        VStack {
            Image("Dogloss")
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
            Text("Пожалуйста, \nпроверьте соединение с интернетом!")
                .multilineTextAlignment(.center)
        }
    }
}
