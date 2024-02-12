//
//  ContentView.swift
//  ISRO
//
//  Created by Evgeniy K on 05.02.2024.
//

import SwiftUI

struct ContentView: View {
    
    //@StateObject var navigationItems = NavigationItem()
    
    var body: some View {
        
        NavigationStack {
            Grid {
                GridRow {
                    NavigationLink(destination: SpacecraftsView()) {
                        CardView(item: ItemData.navigationItems[0])
                    }
                    .gridCellColumns(2)
                    }
                
                GridRow {
                    NavigationLink(destination: LaunchersView()) {
                        CardView(item: ItemData.navigationItems[1])
                    }
                    NavigationLink(destination: SatellitesView()) {
                        CardView(item: ItemData.navigationItems[2])
                    }
                }
                
                GridRow {
                    NavigationLink(destination: CentresView()) {
                        CardView(item: ItemData.navigationItems[3])
                    }
                    .gridCellColumns(2)
                    }
            }
            .padding(20)
            .navigationTitle("ISRO info")
        }
    }
}

#Preview {
    ContentView()
}
