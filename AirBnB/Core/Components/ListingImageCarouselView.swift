//
//  ListingImageCarouselView.swift
//  AirBnB
//
//  Created by Lauro Pimentel on 07/06/24.
//

import SwiftUI

struct ListingImageCarouselView: View {
    var images = [
     "listing-1",
     "listing-2",
     "listing-3",
     "listing-4",
   
    ]
    
    let listing: Listing
    var body: some View {
        TabView{
            ForEach(listing.imageURLs, id:\.self){
                image in
                Image(image).resizable()
                    .scaledToFill()
            }
        }
       
            .tabViewStyle(.page)
    }
}

#Preview {
    ListingImageCarouselView(listing: DeveloperPreview.shared.listings[0])
}
