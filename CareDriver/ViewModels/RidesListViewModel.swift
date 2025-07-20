//
//  RidesListViewModel.swift
//  CareDriver
//
//  Created by JP Rojas Hernández on 19/7/25.
//

import Foundation

@MainActor
class RidesListViewModel: ObservableObject {
    private let driverId = 1
    private let loadRidesFromLocal = true
    
    @Published var rides: [Ride] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let service: APIServiceProtocol
    
    init(service: APIServiceProtocol = APIService()) {
        self.service = service
    }
    
    func loadRides() async {
        isLoading = true
        
        // Set isLoading to false in a defer block to ensure it runs after the async operation completes
        defer { isLoading = false }
        
        do {
            let ridesList = try await service.fetchRides(driverId: driverId, loadFromLocal: loadRidesFromLocal)
            // Sort result rides in descending order by score.
            rides = ridesList.rides.sorted { $0.score > $1.score }
        } catch {
            errorMessage = error.localizedDescription
        }
    }
    
    // MARK: - Utils
    
    /// Function to sort rides in descending or ascending order by score.
    internal func sortRidesByScore(rides: [Ride], descending: Bool = true) -> [Ride] {
        if descending {
            return rides.sorted { $0.score > $1.score }
        } else {
            return rides.sorted { $0.score < $1.score }
        }
    }
}
