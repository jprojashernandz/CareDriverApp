//
//  MockAPIService.swift
//  CareDriverTests
//
//  Created by JP Rojas Hernández on 19/7/25.
//

import Foundation

class MockAPIService: APIServiceProtocol {
    
    let mockRides = [
        Ride(
            id: 1,
            startAddress: "A",
            destinationAddress: "B",
            distanceMiles: 5.0,
            durationMinutes: 10,
            earnings: 15.0,
            commuteDistanceMiles: 2.0,
            commuteDurationMiutes: 5,
            score: 25.0),
        Ride(
            id: 2,
            startAddress: "C",
            destinationAddress: "D",
            distanceMiles: 5.0,
            durationMinutes: 10,
            earnings: 15.0,
            commuteDistanceMiles: 2.0,
            commuteDurationMiutes: 5,
            score: 20.0),
        Ride(
            id: 1,
            startAddress: "E",
            destinationAddress: "F",
            distanceMiles: 5.0,
            durationMinutes: 10,
            earnings: 15.0,
            commuteDistanceMiles: 2.0,
            commuteDurationMiutes: 5,
            score: 30.0)
    ]
    
    var shouldThrowError = false
    
    func fetchRides(driverId: Int, loadFromLocal: Bool) async throws -> RidesList {
        if shouldThrowError {
            throw NSError(domain: "", code: 500, userInfo: [NSLocalizedDescriptionKey: "Fetch failed"])
        }
        
        return RidesList(rides: mockRides)
    }
}
