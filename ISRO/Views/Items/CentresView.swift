//
//  CentresView.swift
//  ISRO
//
//  Created by Evgeniy K on 16.04.2024.
//

import SwiftUI

struct CentresView: View {

    @StateObject var modelData = ModelData()

    var body: some View {
        VStack {
            Text("ISRO centers".uppercased())
                .padding()
                .font(.callout)
                .multilineTextAlignment(.center)
                .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)

            List {
                ForEach(modelData.centres, id: \.self) {
                    center in
                    HStack {
                        Text("\(center.id)")
                        VStack {
                            Text(center.name)
                            Text(center.Place)
                            Text(center.State)
                        }
                    }
                }
            }
            .listStyle(.plain)
        }
        .task {
            do {
                try await modelData.fetchCenters()
            } catch {
                print(error)
            }
        }
    }
}

#Preview {
    CentresView()
}
