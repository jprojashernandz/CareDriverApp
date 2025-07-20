//
//  CareDriverTests.swift
//  CareDriverTests
//
//  Created by JP Rojas Hernández on 19/7/25.
//

import XCTest
@testable import CareDriver

@MainActor
final class CareDriverTests: XCTestCase {
    
    func test_loadRides_successful() async {
        let mockAPIService = MockAPIService()
        let viewModel = RidesListViewModel(service: mockAPIService)
        
        await viewModel.loadRides()
        
        XCTAssertEqual(viewModel.rides, mockAPIService.mockRides.sorted { $0.score > $1.score })
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertNil(viewModel.errorMessage)
    }
    
    func test_loadRides_failure() async {
        let mockAPIService = MockAPIService()
        mockAPIService.shouldThrowError = true
        let viewModel = RidesListViewModel(service: mockAPIService)
        
        await viewModel.loadRides()
        
        XCTAssertEqual(viewModel.rides, [])
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertEqual(viewModel.errorMessage, "Fetch failed")
    }
    
    func test_sortRidesByScore_descending() {
        let mockAPIService = MockAPIService()
        let viewModel = RidesListViewModel(service: mockAPIService)
        let rides = mockAPIService.mockRides
        let sorted = viewModel.sortRidesByScore(rides: rides, descending: true)
        XCTAssertEqual(sorted, [rides[2], rides[0], rides[1]])
    }
    
    func test_sortRidesByScore_ascending() {
        let mockAPIService = MockAPIService()
        let viewModel = RidesListViewModel(service: mockAPIService)
        let rides = mockAPIService.mockRides
        let sorted = viewModel.sortRidesByScore(rides: rides, descending: false)
        XCTAssertEqual(sorted, [rides[1], rides[0], rides[2]])
    }
}
