//
//  CardView.swift
//  ISRO
//
//  Created by Evgeniy K on 09.02.2024.
//

import SwiftUI

struct CardView: View {

    let item: NavigationItem

    var body: some View {

        HStack {

            Spacer()

            VStack(spacing:  12) {
                Text(item.title.uppercased())
                    .font(.title2)
                    .fontWidth(.expanded)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)

                Text(item.description.uppercased())
                    .font(.callout)
                    .multilineTextAlignment(.center)
                    .opacity(0.8)
            }
            .padding()

            Spacer()

        }
        .clipShape(.rect(cornerRadius: 25))
        .overlay {
            RoundedRectangle(cornerRadius: 25)
                .stroke()
                .fill()
        }
        .padding()
    }
}

#Preview {
    CardView(item: ItemData.testItem)
}
