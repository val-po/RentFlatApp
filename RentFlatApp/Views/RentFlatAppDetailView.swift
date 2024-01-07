//
//  RentFlatAppDetailView.swift
//  RentFlatApp
//
//  Created by Val Po on 07.01.2024.
//

import SwiftUI

struct RentFlatDetailView: View {
    
    let model: RentFlatListings
    
    var body: some View {
        VStack(alignment: .leading) {
            GeometryReader { proxy in
                ScrollView(.vertical) {
                    AsyncImage(url: URL(string: model.xl_picture_url ?? ""))
                        .aspectRatio(contentMode: .fit)
                        .frame(width: proxy.frame(in: .global).width, height: proxy.frame(in: .global).width)
                        .clipped()
                    
                    if let price = model.price {
                        Text("Rate:"+String(model.price ?? 0))
                    }
                    
                    Text(model.description ?? "Description is empty")
                        .padding()
                    
                    Text(model.summary ?? "Summary is empty")
                        .padding()
                    
                    Text("House rules: "+(model.house_rules ?? "is empty"))
                        .padding()
                    
                    Text("About Host")
                        .bold()
                        .font(.title3)
                    
                    HStack {
                        AsyncImage(url: URL(string: model.host_picture_url ?? ""))
                            .frame(width: 75, height: 75)
                            .aspectRatio(contentMode: .fill)
                            .clipShape(Circle())
                        
                        Text(model.host_name ?? "Host name")
                            .bold()
                    }
                    .padding()
                    
                    Text("Hosting since:" + (model.host_since ?? "-"))
                }
                .frame(maxWidth: proxy.frame(in: .local).width)
            }
        }
        .navigationTitle(model.name)
    }
}
