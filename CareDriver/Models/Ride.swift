//
//  Ride.swift
//  CareDriver
//
//  Created by JP Rojas Hernández on 19/7/25.
//

import Foundation

struct Ride: Identifiable, Codable, Equatable {
    var id: Int
    var startAddress: String
    var destinationAddress: String
    var distanceMiles: Double
    var durationMinutes: Int
    var earnings: Double
    var commuteDistanceMiles: Double
    var commuteDurationMiutes: Int
    var score: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case startAddress = "start_address"
        case destinationAddress = "destination_address"
        case distanceMiles = "ride_distance_miles"
        case durationMinutes = "ride_duration_minutes"
        case earnings = "ride_earnings"
        case commuteDistanceMiles = "commute_distance_miles"
        case commuteDurationMiutes = "commute_duration_minutes"
        case score
    }
}

struct RidesList: Decodable {
    var rides: [Ride]
}
