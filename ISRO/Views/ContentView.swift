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
            Grid {
                Group {
                    GridRow {
                        NavigationLink(destination: SpacecraftsView()) {
                            CardView(item: ItemData.navigationItems[0])
                        }
                    }
                    
                    GridRow {
                        NavigationLink(destination: LaunchersView()) {
                            CardView(item: ItemData.navigationItems[1])
                        }
                    }
                    
                    GridRow {
                        NavigationLink(destination: SatellitesView()) {
                            CardView(item: ItemData.navigationItems[2])
                        }
                    }
                    
                    GridRow {
                        NavigationLink(destination: CentresView()) {
                            CardView(item: ItemData.navigationItems[3])
                        }
                    }
                }
                .gridCellColumns(2)
            }
            .padding([.leading, .bottom, .trailing], 20)
            .navigationTitle("ISRO info")
        }
    }
}

#Preview {
    ContentView()
}
