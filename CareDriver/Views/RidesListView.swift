//
//  ContentView.swift
//  CareDriver
//
//  Created by JP Rojas Hernández on 19/7/25.
//

import SwiftUI

struct RidesListView: View {
    @StateObject private var viewModel = RidesListViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                List(viewModel.rides, id: \.id) { item in
                    HStack(spacing: 16) {
                        VStack(alignment: .leading) {
                            RoutePointView(type: .origin, address: item.startAddress)
                            RoutePointView(type: .destination, address: item.destinationAddress)
                            
                        }
                        Spacer()
                        VStack(alignment: .trailing, spacing: 8) {
                            
                            Text("$\(item.earnings, specifier: "%.2f")")
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .font(.headline)
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.orange, lineWidth: 2)
                                )
                                .foregroundColor(.orange) // Text color
                            HStack {
                                Text(item.score, format: .number.precision(.fractionLength(1)))
                                    .font(.system(size: 14, weight: .bold))
                                    .foregroundColor(.gray)
                                Image(systemName: "star.fill")
                                    .resizable() // Make the image resizable
                                    .frame(width: 12, height: 12) // Set width and height to 12 points
                                    .foregroundColor(.gray)
                                
                            }
                        }
                        .frame(maxHeight: .infinity, alignment: .top)
                        .padding(.top, 8)
                        
                        
                    }
                    .padding(.vertical, 12)
                }
                
                // Show a loading indicator when data is being fetched
                if viewModel.isLoading {
                    ProgressView()
                }
            }
            .navigationTitle("Rides for you")
            .task {
                await viewModel.loadRides()
            }
            .alert("Error", isPresented: Binding<Bool>(
                get: { viewModel.errorMessage != nil },
                set: { _ in viewModel.errorMessage = nil }
            )) {
                Button("OK", role: .cancel) {}
            } message: {
                Text(viewModel.errorMessage ?? "")
            }
        }
        
        
    }
}

struct RidesListView_Previews: PreviewProvider {
    static var previews: some View {
        RidesListView()
    }
}
