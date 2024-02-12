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
//                GridRow {
//                    CardView().gridCellColumns(2)
//                }
//                GridRow {
//                    CardView()
//                    CardView()
//                }
//                GridRow {
//                    CardView().gridCellColumns(2)
//                }
            }
            .padding(20)
            
            
//            VStack {
//                NavigationLink {
//                    SpacecraftsView()
//                } label: {
//                    HStack {
//                        Text("Spacecrafts")
//                        Spacer()
//                        Image(systemName: "chevron.right")
//                    }
//                    .padding()
//                }
//                Spacer()
//            }
            .navigationTitle("ISRO info")
        }
    }
}

#Preview {
    ContentView()
}
