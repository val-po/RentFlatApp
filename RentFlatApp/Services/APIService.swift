//
//  APIService.swift
//  RentFlatApp
//
//  Created by Val Po on 07.01.2024.
//

import Foundation

final class APIService {
    
    init() {}
    
    struct Constant {
        static let apiUrl = URL(string:  "https://public.opendatasoft.com/api/explore/v2.1/catalog/datasets/airbnb-listings/records?limit=100&refine=city%3A%22New%20York%22&refine=room_type%3A%22Entire%20home%2Fapt%22")
    }
    
    public func getListings(comletion: @escaping (Result<[RentFlatListings], Error>) -> Void) {
        DispatchQueue.main.async {
            guard let url = Constant.apiUrl else {
                print("Bad url")
                return
            }
            let request = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request) { data, _, error in
                guard let data = data, error == nil else {
                    if let error {
                        comletion(.failure(error))
                    }
                    return
                }
                do {
                    print("Doing response")
                    let response = try JSONDecoder().decode(RentFlatListingsResponse.self, from: data)
                    comletion(.success(response.results))
                } catch {
                    comletion(.failure(error))
                    print(error.localizedDescription)
                }
            }
            task.resume()
        }
        
    }
}
