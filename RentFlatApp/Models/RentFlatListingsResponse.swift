//
//  RentFlatListingsResponse.swift
//  RentFlatApp
//
//  Created by Val Po on 07.01.2024.
//

import Foundation

struct RentFlatListingsResponse: Codable {
    
    let total_count: Int
    let results: [RentFlatListings]
}
