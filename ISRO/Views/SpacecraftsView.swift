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
            Text("List of spacecraft and vehicles launched by ISRO".uppercased())
                .padding()
                .font(.callout)
                .multilineTextAlignment(.center)
                .opacity(0.8)
            List {
                    ForEach(network.spacecrafts, id: \.self) { spacecraft in
                        HStack {
                            Text("\(spacecraft.id)")
                                .padding(.horizontal)
                            Text(spacecraft.name)
                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.black).opacity(0.95)
                        .foregroundStyle(.white)
                        .clipShape(.rect(cornerRadius: 20))
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke()
                                .fill(.white.opacity(0.2))
                        )
                    }
            }
            .listStyle(.plain)
            
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
