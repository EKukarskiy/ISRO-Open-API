//
//  SpacecraftsView.swift
//  ISRO
//
//  Created by Evgeniy K on 05.02.2024.
//

import SwiftUI

struct SpacecraftsView: View {
    
    @StateObject var network = Network()
    
    var body: some View {
        
        ZStack {
            List (network.spacecrafts, id: \.self) { spacecraft in
                HStack {
                    Text("\(spacecraft.id)")
                    Spacer()
                    Text(spacecraft.name)
                }
            }
            
            if network.inProgress {
                ProgressView()
            }
        }
        .alert(isPresented: $network.showError) {
            Alert(title: Text(network.errorMessage))
        }
        .task {
            await network.fethcAllSpacecrafts()
        }
    }
}


#Preview {
    SpacecraftsView()
}
