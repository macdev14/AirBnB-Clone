//
//  ListingView.swift
//  AirBnB
//
//  Created by Lauro Pimentel on 07/06/24.
//

import SwiftUI

struct ListingView: View {
    
    var images = [
     "listing-1",
     "listing-2",
     "listing-3",
     "listing-4",
   
    ]
    
    var body: some View {
        VStack(spacing:8){
//            images
            ListingImageCarouselView()
            
            .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .tabViewStyle(.page)
//            listing details
            HStack{
//                details
                
                VStack(alignment: .leading){
                    Text("Miami, FL").fontWeight(.semibold)
                        .foregroundStyle(.black)
                    Text("12 mi away")
                        .foregroundStyle(.gray)
                        
                    Text("Nov 3 - 10")
                        .foregroundStyle(.gray)
                    
                    HStack(spacing:4) {
                        Text("$567").fontWeight(.semibold)
                        
                        Text("per night")
                    }
                }
                
                Spacer()
//                rating
                HStack(spacing:2){
                    Image(systemName: "star.fill")
                    Text("4.86")
                }.foregroundStyle(.black)
                
            }
          
            .font(.footnote)
            
        }
    }
}

#Preview {
    ListingView()
}
