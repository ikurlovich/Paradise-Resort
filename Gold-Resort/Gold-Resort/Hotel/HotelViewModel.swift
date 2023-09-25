//
//  HotelViewModel.swift
//  Gold-Resort
//
//  Created by Илья Курлович on 14.09.2023.
//

import Foundation

class HotelViewModel: ObservableObject {
    var hotel: HotelInfo?
    @Published var state: State = .loading

    enum State {
        case loading
        case success
        case error(error: Error)
    }

    func load() {
        guard let url = URL(string: "https://run.mocky.io/v3/35e0d18e-2521-4f1b-a575-f0fe366f66e3") else {
            // TODO: - process error
            return
        }
        state = .loading
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            if let error {
                // TODO: - Process error
                self?.state = .error(error: error)
            }
            if let data = data {
                let decoder = JSONDecoder()
                if let decodedHotel = try? decoder.decode(HotelInfo.self, from: data) {
                    DispatchQueue.main.async {
                        self?.hotel = decodedHotel
                        self?.state = .success
                    }
                }
            }
        }

        task.resume()
    }
}
