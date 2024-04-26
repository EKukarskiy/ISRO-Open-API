//
//  SpacecraftsView.swift
//  ISRO
//
//  Created by Evgeniy K on 05.02.2024.
//

import SwiftUI

struct SpacecraftsView: View {
    
    @StateObject var modelData = ModelData()
    
    var body: some View {
        
        VStack {
            Text("List of spacecraft and vehicles launched by ISRO".uppercased())
                .padding(.bottom)
                .font(.callout)
                .multilineTextAlignment(.center)
                .opacity(0.8)
            
            ScrollView {
                LazyVStack(spacing: 8) {
                    ForEach(modelData.spacecrafts, id: \.self) { spacecraft in
                        HStack {
                            Text("\(spacecraft.id)")
                                .padding(.horizontal)
                            Text(spacecraft.name)
                            Spacer()
                        }
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
            }
        }
        .task {
            do {
                try await modelData.fetchSpacecrafts()
            } catch {
                print(error)
            }
        }
    }
}

#Preview {
    SpacecraftsView()
}
