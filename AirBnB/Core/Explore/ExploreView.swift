//
//  ExploreView.swift
//  AirBnB
//
//  Created by Lauro Pimentel on 07/06/24.
//

import SwiftUI

struct ExploreView: View {
    @State private var showDestinationSearchView = false
    var body: some View {
        NavigationStack{
            if showDestinationSearchView{
                DestinationSearchView(show: $showDestinationSearchView)
            }else{
                
                ScrollView{
                    SearchAndFilterBar().onTapGesture {
                        withAnimation(.snappy){
                            showDestinationSearchView.toggle()
                        }
                    }
                    LazyVStack(spacing: 32){
                        ForEach(0...10, id: \.self){ listing in
                            
                            NavigationLink(value: listing){
                                ListingView().frame(height: 400)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                            
                            
                            
                            
                            
                        }
                    }.padding()
                }
                
                .navigationDestination(for: Int.self){ listing in
                    ListingDetailView()
                        .navigationBarBackButtonHidden()
                }
            }
        }
    }
}

#Preview {
    ExploreView()
}
