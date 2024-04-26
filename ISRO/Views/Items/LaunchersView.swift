//
//  LaunchersView.swift
//  ISRO
//
//  Created by Evgeniy K on 15.04.2024.
//

import SwiftUI

struct LaunchersView: View {
    
    @StateObject var modelData = ModelData()
    
    var body: some View {
        
        VStack {
            Text("Types of launchers: \nPolar (PSLV), Geosynchronous (GSLV), Geosynchronous Mk-III (LVM3)".uppercased())
                .padding(.bottom)
                .font(.callout)
                .multilineTextAlignment(.center)
                .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
            
            List {
                ForEach(modelData.launchers, id: \.self) {
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
        }
        .task {
            do {
                try await modelData.fetchLauncher()
            } catch {
                print(error)
            }
        }
    }
}

#Preview {
    LaunchersView()
}
