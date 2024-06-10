//
//  Listing.swift
//  AirBnB
//
//  Created by Lauro Pimentel on 09/06/24.
//

import Foundation

struct Listing : Identifiable, Codable {
    let id: String
    let ownerUid : String
    let ownerName : String
    let ownerImageURL : String
    let numberOfBedrooms: Int
    let numberOfBathrooms: Int
    let numberOfGuests: Int
    let numberOfBeds: Int
    var pricePerNight: Int
    let latitude: Double
    let longitude: Double
    let address : String
    let city : String
    let state : String
    let title : String
    let rating : Double
}
