//
//  RoomsButtonBlueUI.swift
//  Gold-Resort
//
//  Created by Илья Курлович on 14.09.2023.
//

import SwiftUI

struct RoomsButtonBlueUI: View {
    var body: some View {
        Button {
            // none action
        } label: {
            HStack {
                HStack(alignment: .center) {
                    Text("Подробнее о номере")
                        .foregroundStyle(Color("RoomsButtonText"))
                    Image("Blue")
                }
                .padding(10)
                .background(Color("RoomsButton"))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.horizontal)
                Spacer()
            }
        }
    }
}
