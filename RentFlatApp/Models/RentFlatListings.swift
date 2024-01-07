//
//  RentFlatListings.swift
//  RentFlatApp
//
//  Created by Val Po on 07.01.2024.
//

import Foundation

struct RentFlatListings: Codable, Identifiable, Hashable {
    
    let id: String
    let listingUrl: String?
    let name: String
    let summary: String?
    let space: String?
    let description: String?
    let house_rules: String?
    let thumbnail_url: String?
    let medium_url: String?
    let xl_picture_url: String?
    let neighbourhood: String?
    let amenities: [String]?
    let price: Int?

    let host_name: String?
    let host_since: String?
    let host_thumbnail_url: String?
    let host_picture_url: String?
}
