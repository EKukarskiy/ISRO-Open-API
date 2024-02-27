//
//  LaunchersView.swift
//  ISRO
//
//  Created by Evgeniy K on 08.02.2024.
//

import SwiftUI

struct LaunchersView: View {
    
    @StateObject var network = Network()
    
    var body: some View {
        VStack {
            Text("Types of Indian operational launch satellites: \nPolar (PSLV), Geosynchronous (GSLV), Geosynchronous Mk-III (LVM3)".uppercased())
                .padding()
                .font(.callout)
                .multilineTextAlignment(.center)
                .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
            
            List {
                ForEach(network.launchers, id: \.self) {
                    launcher in
                    HStack {
                        Text(launcher.id)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.black).opacity(0.95)
                    .foregroundStyle(.white)
                    .clipShape(.rect(cornerRadius: 20))
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke()
                            .fill(.white.opacity(0.2)))
                }
            }
            .listStyle(.plain)
            if network.inProgress {
                ProgressView()
            }
        }
        .task {
            await network.fethcAllLaunchers()
        }
    }
}

#Preview {
    LaunchersView()
}
