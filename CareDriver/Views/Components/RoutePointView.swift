//
//  OriginDestinationView.swift
//  CareDriver
//
//  Created by JP Rojas Hernández on 20/7/25.
//

import SwiftUI

enum RoutePointType {
    case origin
    case destination
}

struct RoutePointView: View {
    let type: RoutePointType
    let address: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 8) {
                // Circle icon
                Circle()
                    .frame(width: 8, height: 20)
                    .foregroundColor(type == .origin ? .blue : .orange) // Change color based on type
                
                Text(type == .origin ? "Origin" : "Destination")
                    .font(.headline)
            }
            Text(address)
        }
    }
    
}

struct RoutePointView_Previews: PreviewProvider {
    static var previews: some View {
        RoutePointView(type: .origin, address: "123 Main St, Springfield")
    }
}
