//
//  RentFlatListingCardView.swift
//  RentFlatApp
//
//  Created by Val Po on 07.01.2024.
//

import SwiftUI

struct RentFlatListingCardView: View {
    
    let model: RentFlatListings
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: model.thumbnail_url ?? ""))
                .frame(width: 100, height: 100)
                .scaledToFit()
                .aspectRatio(contentMode: .fill)
                .clipped()
            
            VStack {
                Text(model.name)
                    .font(.title3)
                    .bold()
                
                Text(model.description ?? "Description")
                    .lineLimit(3)
                    .foregroundColor(.gray)
                    .font(.body)
            }
        }
    }
}
