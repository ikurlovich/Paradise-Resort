//
//  HotelInfo.swift
//  Gold-Resort
//
//  Created by Илья Курлович on 13.09.2023.
//

import Foundation

struct HotelInfo: Codable, Identifiable {
    let id: Int
    let name: String
    let adress: String
    let minimal_price: Int
    let price_for_it: String
    let rating: Int
    let rating_name: String
    let image_urls: [String]
    let about_the_hotel: DetailHotel
    
    static let example = HotelInfo(id: 1, name: "Отель без интернета", adress: "Возможно Самоли, интернета нет", minimal_price: 134268, price_for_it: "Всё включено кроме интернета", rating: 4, rating_name: "Хорошо", image_urls: ["https://www.atorus.ru/sites/default/files/upload/image/News/56149/Club_Priv%C3%A9_by_Belek_Club_House.jpg", "https://deluxe.voyage/useruploads/articles/The_Makadi_Spa_Hotel_02.jpg", "https://deluxe.voyage/useruploads/articles/article_1eb0a64d00.jpg"], about_the_hotel: DetailHotel(description: "Отель хороший, жаль нет интернета", peculiarities: ["Интернета нет", "1 км до пляжа", "Бесплатный фитнес-клуб", "20 км до аэропорта"]))
    
}

struct DetailHotel: Codable {
    let description: String
    let peculiarities: [String]
}
