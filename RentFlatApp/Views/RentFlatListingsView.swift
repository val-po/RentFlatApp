//
//  RentFlatListingsView.swift
//  RentFlatApp
//
//  Created by Val Po on 07.01.2024.
//

import SwiftUI

struct RentFlatListingsView: View {
    
    @StateObject var viewModel = RentFlatListingsViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.listings.isEmpty {
                    ProgressView()
                        .progressViewStyle(.automatic)
                } else {
                    List(viewModel.listings) { listing in
                        NavigationLink(destination: RentFlatDetailView(model: listing), label: {
                            RentFlatListingCardView(model: listing)
                        })
                    }
                }
            }
            .navigationTitle("Available Flats")
        }
        .onAppear {
            viewModel.fetchListings()
        }
    }
}

#Preview {
    RentFlatListingsView()
}
