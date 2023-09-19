//
//  OrderViewModel.swift
//  Gold-Resort
//
//  Created by Илья Курлович on 16.09.2023.
//

import Foundation

class OrderViewModel: ObservableObject {
    @Published var order: OrderInfo?

    init() {
        load()
    }

    func load() {
        let url = URL(string: "https://run.mocky.io/v3/e8868481-743f-4eb2-a0d7-2bc4012275c8")!

        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                let decoder = JSONDecoder()
                if let decodedOrder = try? decoder.decode(OrderInfo.self, from: data) {
                    DispatchQueue.main.async {
                        self.order = decodedOrder
                    }
                }
            }
        }

        task.resume()
    }
}
