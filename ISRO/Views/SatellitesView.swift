//
//  SatellitesView.swift
//  ISRO
//
//  Created by Evgeniy K on 08.02.2024.
//

import SwiftUI

struct SatellitesView: View {
    
    @StateObject var network = Network()
    
    var body: some View {
        VStack {
            Text("List of Customer Satellites".uppercased())
                .padding()
                .font(.callout)
                .multilineTextAlignment(.center)
                .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
            
            List {
                
            }
            .listStyle(.plain)
        }
    }
}

#Preview {
    SatellitesView()
}
