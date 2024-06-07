//
//  ListingDetailView.swift
//  AirBnB
//
//  Created by Lauro Pimentel on 07/06/24.
//

import SwiftUI

struct ListingDetailView: View {
    
    var images = [
     "listing-1",
     "listing-2",
     "listing-3",
     "listing-4",
   
    ]
    var body: some View {
        ScrollView{
            ListingImageCarouselView()
            .frame(height: 320)
            
            VStack(alignment: .leading, spacing: 8){
                Text("Miami Villa")
                    .font(.title)
                    .fontWeight(.semibold)
                VStack(alignment: .leading){
                    HStack(spacing:2){
                        Image(systemName: "star.fill")
                        Text("4.86")
                        Text(" - ")
                        Text("28 reviews").underline()
                            .fontWeight(.semibold)
                    }
                    .font(.caption)
                    .foregroundStyle(.black)
                    
                    Text("Miami Florida")
                }.font(.caption)
            }
            .padding(.leading)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
          
            Divider()
            
//            host info view
            
            HStack{
                VStack(alignment: .leading, spacing: 4){
                    Text("The entire villa hosted by John Smith")
                        .font(.headline)
                        .frame(width: 250,alignment: .leading)
                    HStack (spacing: 2){
                        Text("4 guests - ")
                        Text("4 bedrooms - ")
                        Text("4 beds - ")
                        Text("3 baths - ")
                    }.font(.caption)
                }       .frame(width: 300, alignment: .leading)
                Spacer()
                
                Image("profile").resizable()
                    .scaledToFill()
                    .frame(width:64,height: 64)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            }.padding()
            
            Divider()
//             listing features
            VStack(alignment: .leading, spacing: 16){
                ForEach(0 ..< 2){ listing in
                    HStack(spacing:12){
                        Image(systemName: "medal")
                        VStack(alignment: .leading){
                            Text("Superhost")
                                .font(.footnote)
                                .fontWeight(.semibold)
                            Text("Superhosts are experienced, highly rated hosts who are commited to providing great stars for guests")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        Spacer()
                    }
                   
                }
            }
            .padding()
            
            
            Divider()
            
//            bedrooms view
            VStack(alignment: .leading, spacing: 16){
                Text("Where you'll sleep")
                    .font(.headline)
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 16) {
                        ForEach(1 ..< 5){ bedroom in
                            VStack{
                                Image(systemName: "bed.double")
                                
                                Text("Bedroom \(bedroom)")
                            }.frame(width: 132, height: 100)
                                .overlay{
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(lineWidth: 1)
                                        .foregroundStyle(.gray)
                                }
                        }
                    }
                }.scrollTargetBehavior(.paging)
            }.padding()
            Divider()
            
            
//            ammenities
            VStack(alignment: .leading,spacing: 16){
                Text("What this place offers")
                    .font(.headline)
                ForEach(0 ..< 5){ feature in
                    HStack{
                        Image(systemName: "wifi" )
                            .frame(width:32)
                        Text("Wifi").font(.footnote)
                        Spacer()
                    }
                }
            }.padding()
            
            Divider()
            
            VStack(alignment: .leading,spacing: 16){
                
            }
            
        }
    }
}

#Preview {
    ListingDetailView()
}
