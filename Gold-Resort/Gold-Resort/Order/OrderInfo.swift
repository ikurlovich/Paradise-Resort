//
//  OrderInfo.swift
//  Gold-Resort
//
//  Created by Илья Курлович on 16.09.2023.
//

import Foundation

struct OrderInfo: Codable, Identifiable {
    let id: Int
    let hotel_name: String
    let hotel_adress: String
    let horating: Int
    let rating_name: String
    let departure: String
    let arrival_country: String
    let tour_date_start: String
    let tour_date_stop: String
    let number_of_nights: Int
    let room: String
    let nutrition: String
    let tour_price: Int
    let fuel_charge: Int
    let service_charge: Int
    
    static let example = OrderInfo(id: 1, hotel_name: "Test", hotel_adress: "Test", horating: 1, rating_name: "Test", departure: "Test", arrival_country: "Test", tour_date_start: "Test", tour_date_stop: "Test", number_of_nights: 1, room: "Test", nutrition: "Test", tour_price: 1, fuel_charge: 1, service_charge: 1)
}
