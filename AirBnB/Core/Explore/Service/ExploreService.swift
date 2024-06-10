//
//  ExploreService.swift
//  AirBnB
//
//  Created by Lauro Pimentel on 09/06/24.
//

import Foundation

class ExploreService{
    func fetchListings() async throws -> [Listing]{
        return DeveloperPreview.shared.listings
    }
}
