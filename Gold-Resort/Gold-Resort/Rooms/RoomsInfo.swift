//
//  RoomsInfo.swift
//  Gold-Resort
//
//  Created by Илья Курлович on 14.09.2023.
//

import Foundation

struct RoomsInfo: Codable {
    var rooms: [Room]
}

struct Room: Codable, Identifiable {
    let id: Int
    let name: String
    let price: Int
    let price_per: String
    let peculiarities: [String]
    let image_urls: [String]
}
