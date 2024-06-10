//
//  ListingDetailView.swift
//  AirBnB
//
//  Created by Lauro Pimentel on 07/06/24.
//

import SwiftUI
import MapKit
struct ListingDetailView: View {
    
    let listing: Listing
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView{
            ZStack(alignment: .topLeading) {
                ListingImageCarouselView(listing:listing)
                    .frame(height: 320)
                
                Button{
                    dismiss()
                }label: {
                    Image(systemName: "chevron.left")
                        .background{
                            Circle().fill(.white)
                                .frame(width:32, height: 32)
                        }.padding(32)
                }
            }
            
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
                Text("Where you will be")
                    .font(.headline)
                Map().frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .padding()
            
        }
        .toolbar(.hidden, for: .tabBar)
        .ignoresSafeArea()
        .padding(.bottom, 64)
        .overlay(alignment: .bottom) {
            VStack{
                Divider().padding(.bottom)
                HStack{
                    VStack(alignment: .leading){
                        Text("$500").font(.subheadline)
                            .fontWeight(.semibold)
                            Text("Total before taxes")
                            .font(.footnote)
                        Text("Oct 15 - 20")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .underline()
                    }
                    Spacer()
                    Button{
                        
                    }label: {
                        Text("Reserve")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 140, height: 40)
                            .background(.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }.padding(.horizontal, 32)
            }.background(.white)
        }
    }
}

#Preview {
    ListingDetailView(listing: DeveloperPreview.shared.listings[0])
}
