//
//  APIService.swift
//  CareDriver
//
//  Created by JP Rojas Hernández on 19/7/25.
//

import Foundation

protocol APIServiceProtocol {
    func fetchRides(driverId: Int, loadFromLocal: Bool) async throws -> RidesList
}

class APIService: APIServiceProtocol {
    func fetchRides(driverId: Int, loadFromLocal: Bool) async throws -> RidesList {
        // In a real application, we would typically fetch data from a remote server.
        // For this example, I'm allowing to load the data from a local JSON file or from a remote API based on the `loadFromLocal` parameter.
        if loadFromLocal == true {
            guard let fileURL = Bundle.main.url(forResource: "rides", withExtension: "json") else {
                throw NSError(domain: "", code: 400, userInfo: [ NSLocalizedDescriptionKey: "Data was not retrieved from request"])
            }
            let data = try! Data(contentsOf: fileURL)
            return try JSONDecoder().decode(RidesList.self, from: data)
        } else {
            let url = URL(string: "https://018809ec-5a49-4066-a6bb-4ec12254d27c.mock.pstmn.io/api/drivers/\(driverId)/rides")!
            let (data, _) = try await URLSession.shared.data(from: url)
            return try JSONDecoder().decode(RidesList.self, from: data)
        }
    }
}
