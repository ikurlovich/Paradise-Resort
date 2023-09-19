//
//  Gold_ResortApp.swift
//  Gold-Resort
//
//  Created by Илья Курлович on 12.09.2023.
//

import SwiftUI

@main
struct Gold_ResortApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(HotelViewModel())
                .environmentObject(PersonVM())
        }
    }
}
