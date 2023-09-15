//
//  HotelViewModel.swift
//  Gold-Resort
//
//  Created by Илья Курлович on 14.09.2023.
//

import Foundation

class HotelViewModel: ObservableObject {
    @Published var hotel: HotelInfo?

    init() {
        load()
    }

    func load() {
        let url = URL(string: "https://run.mocky.io/v3/35e0d18e-2521-4f1b-a575-f0fe366f66e3")!

        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                let decoder = JSONDecoder()
                if let decodedHotel = try? decoder.decode(HotelInfo.self, from: data) {
                    DispatchQueue.main.async {
                        self.hotel = decodedHotel
                    }
                }
            }
        }

        task.resume()
    }
}
