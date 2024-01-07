//
//  RentFlatListingsViewModel.swift
//  RentFlatApp
//
//  Created by Val Po on 07.01.2024.
//

import Foundation

final class RentFlatListingsViewModel: ObservableObject {
    
    private let service = APIService()
    
    @Published var listings: [RentFlatListings] = []
    
    public func fetchListings() {
        service.getListings { [weak self] result in
            switch result {
            case .success(let models):
                print("success")
                DispatchQueue.main.async {
                    self?.listings = models
                }
            case .failure:
                print("failure fetchListings")
                break
            }
        }
    }
}
