//
//  ContentView.swift
//  ISRO
//
//  Created by Evgeniy K on 05.02.2024.
//

import SwiftUI

struct ContentView: View {

    var body: some View {

        NavigationStack {

            NavigationLink(destination: SpacecraftsView()) {
                CardView(item: ItemData.navigationItems[0])
            }
            
            NavigationLink(destination: LaunchersView()) {
                CardView(item: ItemData.navigationItems[1])
            }

            NavigationLink(destination: SatellitesView()) {
                CardView(item: ItemData.navigationItems[2])
            }

            NavigationLink(destination: CentresView()) {
                CardView(item: ItemData.navigationItems[3])
            }
            .navigationTitle("ISRO info")

            Spacer()

        }
        .tint(Color(.label))
    }
}

#Preview {
    ContentView()
}
