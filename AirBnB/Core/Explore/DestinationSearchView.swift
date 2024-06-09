//
//  DestinationSearchView.swift
//  AirBnB
//
//  Created by Lauro Pimentel on 07/06/24.
//

import SwiftUI

enum DestinationSearchOptions{
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {
    @State var selectedOption: DestinationSearchOptions = .location
    @Binding var show: Bool
    @State private var destination = ""
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var numGuests = 0
    var body: some View {
        VStack{
            HStack{
                Button{
                    withAnimation(.snappy)
                    {
                        show.toggle()
                    }
                }label: {
                    Image(systemName: "xmark.circle").imageScale(.large)
                        .foregroundStyle(.black)
            }
                Spacer()
                
                if !destination.isEmpty{
                    Button("Clear"){
                        destination = ""
                    }.foregroundStyle(.black)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                }
                
                
                
            }.padding()
            
//             location
            
            VStack (alignment: .leading){
                if selectedOption == .location {
                    Text("Where to?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        TextField("Search destinations", text: $destination).font(.subheadline)
                    }
                    .frame(height: 44)
                    .padding(.horizontal)
                    .overlay{
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1)
                            .foregroundStyle(Color(.systemGray4))
                    }
                } else{
                    CollapsedPickerView(title: "Where", description: "Add destination")
                }

            }
            
          
            .modifier(CollapsableDestionationViewModifier())
            .frame(height: selectedOption == .location ? 120 : 64)
                .onTapGesture {
                    withAnimation(.snappy){
                        selectedOption = .location
                    }
                }
            
//            date selection view
            VStack(alignment: .leading){
                if selectedOption == .dates{
                    Text("When's your trip?").font(.title2)
                        .fontWeight(.semibold)
                    VStack {
                        DatePicker("From", selection: $startDate, displayedComponents: .date)
                            .onTapGesture(count: 99, perform: {
                                       // overrides tap gesture to fix ios 17.1 bug
                                   })
                      Divider()
                        
                        DatePicker("To", selection: $endDate, displayedComponents: .date)
                            .onTapGesture(count: 99, perform: {
                                       // overrides tap gesture to fix ios 17.1 bug
                                   })
                        
                        
                    }.foregroundStyle(.gray)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                }else{
                    CollapsedPickerView(title: "When", description: "Add dates")
                }
            }
            .modifier(CollapsableDestionationViewModifier())
            .frame(height: selectedOption == .dates ? 180 :64)
            .onTapGesture {
                withAnimation(.snappy){
                    selectedOption = .dates
                }
            }
           
            
//            num guests view
            VStack (alignment: .leading){
                if selectedOption == .guests{
                    
                    Text("Who's coming?").font(.title2)
                        .fontWeight(.semibold)
                    Stepper{
                        Text("\(numGuests) Adults")
                    } onIncrement: {
                        numGuests+=1
                    } onDecrement: {
                        guard numGuests > 0 else {return}
                        numGuests-=1
                    }.onTapGesture(count: 99, perform: {
                        // overrides tap gesture to fix ios 17.1 bug
                    })
                    
                }else{
                    CollapsedPickerView(title: "Who", description: "Add guests")
                }
            } 
            
            .modifier(CollapsableDestionationViewModifier())
            .frame(height: selectedOption == .guests ? 180 :64)
            .onTapGesture {
                withAnimation(.snappy){
                    selectedOption = .guests
                }
            }
        }
        Spacer()
    }
}

#Preview {
    DestinationSearchView(show: .constant(false))
}

struct CollapsableDestionationViewModifier : ViewModifier{
    func body(content: Content) -> some View {
        content.padding()
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding()
                .shadow(radius: 10)
    }
}

struct CollapsedPickerView: View {
    let title: String
    let description: String
    
    var body: some View {
        VStack{
            HStack{
                Text(title).foregroundStyle(.gray)
                Spacer()
                Text(description)
            }
            .fontWeight(.semibold)
            .font(.subheadline)
        }

    }
}

