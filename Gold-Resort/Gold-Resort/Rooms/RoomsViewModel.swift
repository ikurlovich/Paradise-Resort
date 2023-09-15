//
//  RoomsViewModel.swift
//  Gold-Resort
//
//  Created by Илья Курлович on 14.09.2023.
//

import Foundation

class RoomsViewModel: ObservableObject {
    @Published var rooms: RoomsInfo?

    init() {
        load()
    }

    func load() {
        let url = URL(string: "https://run.mocky.io/v3/f9a38183-6f95-43aa-853a-9c83cbb05ecd")!

        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                let decoder = JSONDecoder()
                if let decodedRooms = try? decoder.decode(RoomsInfo.self, from: data) {
                    DispatchQueue.main.async {
                        self.rooms = decodedRooms
                    }
                }
            }
        }

        task.resume()
    }
}
