//
//  ExploreService.swift
//  airbnb
//
//  Created by Charles Michael on 8/4/24.
//

import Foundation

class ExploreService {
    func fetchListings () async throws -> [Listing] {
        return DeveloperPreview.shared.listings
    }
}
