//
//  SatellitesView.swift
//  ISRO
//
//  Created by Evgeniy K on 15.04.2024.
//

import SwiftUI

struct SatellitesView: View {

@StateObject var modelData = ModelData()

    var body: some View {

        VStack {
            Text("List of Customer Satellites".uppercased())
                .padding()
                .font(.callout)
                .multilineTextAlignment(.center)
                .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)

        List {
            ForEach(modelData.satellites) {
                satellite in
                VStack {
                    Text(satellite.id)
                    Text(satellite.country)
                    Text(satellite.launch_date)
                    Text(satellite.mass)
                    Text(satellite.launcher)
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
                try await modelData.fetchSatellites()
            } catch {
                print(error)
            }
        }
    }
}

#Preview {
    SatellitesView()
}
