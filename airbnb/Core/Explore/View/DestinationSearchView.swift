//
//  DestinationSearchView.swift
//  airbnb
//
//  Created by Charles Michael on 8/1/24.
//

import SwiftUI


enum DestinationSearchOptions {
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {
   
    @Binding var show: Bool
    @ObservedObject var viewModel: ExploreViewModel
//    @State private var destination = ""
    @State private var selectedOption: DestinationSearchOptions = .location
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var numGuests = 0
   
    
    var body: some View {
        VStack {
            HStack{
                Button {
                    withAnimation(.snappy) {
                        viewModel.updateListingsForLocation()
                        show.toggle()
                    }
                    
                } label:{
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                }
                Spacer()
                if !viewModel.searchLocation.isEmpty {
                    Button("clear") {
                        viewModel.searchLocation = ""
                        viewModel.updateListingsForLocation()
                    }
                    .foregroundStyle(.black)
                    .font(.subheadline)
                }
            }
            .padding()
            VStack(alignment: .leading){
                if selectedOption == .location {
                    Text("where to?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        
                        TextField("Search Destination", text:$viewModel.searchLocation)
                            .font(.subheadline)
                            .onSubmit {
                                viewModel.updateListingsForLocation()
                                show.toggle()
                            }
                    }
                    .frame(height:44)
                    .padding(.horizontal)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8.0)
                            .stroke(lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                            .foregroundStyle(Color(.systemGray4))
                    }
                } else {
                    CollapsedPickerView(title: "where", description: "Add destination")
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedOption == .location ? 120 : 64)
            .onTapGesture {
                withAnimation(.snappy) { selectedOption = .location}
            }
        
        
        //        data selection view
            VStack(alignment: .leading) {
            if selectedOption == .dates {
               
                    Text("when's your trip?")
                        .font(.title2)
                        .fontWeight(.semibold)
//                    Spacer()
                    VStack {
                        DatePicker("From", selection: $startDate, displayedComponents: .date)
                        Divider()
                        DatePicker("To", selection: $endDate, displayedComponents: .date)
                    }
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
               
            } else {
                CollapsedPickerView(title: "when", description: "Add dates")
            }
        }
        .modifier(CollapsibleDestinationViewModifier())
        .frame(height: selectedOption == .dates ? 180 : 64)
        .onTapGesture {
            withAnimation(.snappy) { selectedOption = .dates}
        }
        
        //        num selection view
            VStack(alignment: .leading) {
                if selectedOption == .guests {
                    
                    Text("Who's coming")
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    Stepper {
                        Text("\(numGuests) Adults")
                    } onIncrement: {
                        numGuests += 1
                    } onDecrement: {
                        guard numGuests > 0 else {return}
                        numGuests -= 1
                    }
            } else {
                CollapsedPickerView(title: "who", description: "Add guests")
            }
        }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedOption == .guests ? 120 : 64)
        .onTapGesture {
            withAnimation(.snappy) { selectedOption = .guests}
        }
            Spacer()
     }
        
    }
    
  }

#Preview {
    DestinationSearchView(show: .constant(false), 
                          viewModel: ExploreViewModel(service: ExploreService()))
}

struct CollapsibleDestinationViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
//            .frame(height: selectedOption == .guests ? 120 : 64)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius:10)
    }
}

struct CollapsedPickerView: View {
    let title: String
    let description: String
    
    var body: some View {
        VStack{
            HStack {
                Text(title)
                    .foregroundStyle(.gray)
                Spacer()
                
                Text(description)
            }
            .fontWeight(.semibold)
            .font(.subheadline)
        }
//        .padding()
//        .background(.white)
//        .clipShape(RoundedRectangle(cornerRadius: 12))
//        .padding()
//        .shadow(radius:10)
    }
}
