//
//  SpacecraftsView.swift
//  ISRO
//
//  Created by Evgeniy K on 05.02.2024.
//

import SwiftUI

struct SpacecraftsView: View {
    
    @StateObject var network = Network()
    let item = ItemData.navigationItems[0]
    
    var body: some View {
        
        VStack {
            List {
                Section {
                    ForEach(network.spacecrafts, id: \.self) { spacecraft in
                        HStack {
                            Text("\(spacecraft.id)")
                                .frame(maxWidth: 20, maxHeight: 20)
                                .padding()
                                .background(.black)
                                .foregroundStyle(.white)
                                .clipShape(.rect(cornerRadius: 20))
                                .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke()
                                    .fill(.white.opacity(0.2))
                                )
                            
                            
                            Text(spacecraft.name)
                                .frame(maxWidth: .infinity, maxHeight: 20)
                                .padding()
                                .background(.black)
                                .foregroundStyle(.white)
                                .clipShape(.rect(cornerRadius: 20))
                                .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke()
                                    .fill(.white.opacity(0.2))
                                )
                        }
                    }
                } header: {
                    Text("List of spacecraft and vehicles launched by ISRO")
                        .font(.callout)
                }
            }
            .listStyle(.inset)
            
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
