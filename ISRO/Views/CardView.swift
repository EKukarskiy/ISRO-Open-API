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

            VStack(spacing: 12) {
                Text(item.title.uppercased())
                    .font(.title3)
                    .fontWidth(.expanded)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    
                Text(item.description)
                    .font(.footnote)
                    .multilineTextAlignment(.center)
                    .opacity(0.7)
                    .frame(maxWidth: .infinity)
            }
            .frame(maxHeight: .infinity)
            .padding().padding(.vertical)
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

#Preview {
    CardView(item: ItemData.testItem)
}
