//
//  ListingDetailView.swift
//  airbnb
//
//  Created by Charles Michael on 7/25/24.
//

import SwiftUI
import MapKit

struct ListingDetailView: View {
    
//    var images = [
//    "listing-1",
//    "listing-2",
//    "listine-3",
//    "listing-4",
//    ]
    
    @Environment(\.dismiss) var dismiss
    let listing: Listing
    @State private var cameraPosition: MapCameraPosition
    
    init(listing: Listing) {
        self.listing = listing
        
        let region = MKCoordinateRegion(
//            center: CLLocationCoordinate2D(latitude: 25.7602,
//                                                  longitude: -80.1959),
            
            center: listing.city == "Los Angeles" ? .losAngeles : .Miami,
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        self._cameraPosition = State(initialValue: .region(region))
    }
    
    var body: some View {
        ScrollView {
            ZStack (alignment: .topLeading) {
                ListingImageCarouselView(listing: listing)
                    .frame(height:320)
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .background{
                            Circle()
                                .fill(.white)
                                .frame(width:32, height:32)
                        }
                        .padding(32)
                }
               
            }
            
            VStack(alignment: .leading, spacing: 0){
                Text(listing.title)
                    .font(.title)
                    .fontWeight(.semibold)
                
                VStack(alignment: .leading){
                    HStack(spacing: 2) {
                       
                            Image(systemName: "star.fill")
                        Text("\(listing.rating)")
                        Text("-")
                        Text("28  Reviews")
                            .underline()
                            .fontWeight(.semibold)
                        }
                   
                    .foregroundStyle(.black)
                    Text("\(listing.city), \(listing.state)")
                    }
                .font(.caption)
            }
            .padding(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            Divider()
            
//             host info view
            HStack{
                VStack (alignment:.leading, spacing:4){
                    Text("Entire \(listing.type.description) hosted by \(listing.ownerName)")
                        .font(.headline)
                        .frame(width:250, alignment: .leading)
                    HStack(spacing:2) {
                        Text("\(listing.numberOfGuests) guests -")
                        Text("\(listing.numberOfBedrooms) bedrooms -")
                        Text("\(listing.numberOfBeds) beds-")
                        Text("\(listing.numberOfBathrooms) baths")
                    }
                    .font(.caption)
                }
                .frame(width:300, alignment: .leading)
                Spacer()
                Image(listing.ownerImageUrl)
                    .resizable()
                    .scaledToFill()
                    .frame(width:64, height:64)
                    .clipShape(Circle())
                
            }
            .padding()
            Divider()
            
            VStack(alignment: .leading, spacing:16) {
                ForEach(listing.features){feature in
                    HStack(spacing:12){
                        Image(systemName: feature.imageName)
                        VStack(alignment: .leading){
                            Text(feature.title)
                                .font(.footnote)
                                .fontWeight(.semibold)
                            Text(feature.subtitle)
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        Spacer()
                    }
                }
            }
//            .frame(maxWidth)
            .padding()
            Divider()
            
            VStack(alignment: .leading, spacing:16){
                Text("Where you will sleep")
                    .font(.headline)
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 16) {
                        ForEach(1 ... listing.numberOfBedrooms, id: \.self) {
                            bedroom in
                            
                            VStack {
                                Image(systemName: "bed.double")
                                Text("Bedroom \(bedroom)")
                            }
                            .frame(width:132, height:100)
                            .overlay {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(lineWidth: 1)
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                }
                .scrollTargetBehavior(.paging)
            }
            .padding()
            
            Divider()
            
//            listing amenities
            
            VStack(alignment: .leading, spacing:16){
            Text("What this place offers")
                    .font(.headline)
                ForEach(listing.amenities) {
                    amenity in
                    HStack {
                        Image(systemName:amenity.imageName)
                            .frame(width: 32)
                        
                        Text(amenity.title)
                            .font(.footnote)
                        Spacer()
                    }
                }
            }
            .padding()
            
            Divider()
            
            VStack(alignment: .leading, spacing:16){
                Text("where you will be")
                    .font(.headline)
                
                Map(position: $cameraPosition)
                    .frame(height:200)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .padding()
        }
        .toolbar(.hidden, for: .tabBar)
        .ignoresSafeArea()
        .padding(.bottom, 64)
        .overlay(alignment:.bottom){
            VStack {
                Divider()
                    .padding(.bottom)
                
                HStack {
                    VStack (alignment:.leading){
                        Text("$\(listing.pricePerNight)")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        Text("Total before taxes")
                            .font(.footnote)
                        Text("Oct15-20")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .underline()
                        
                    }
                    Spacer()
                    Button {
                        
                    } label: {
                        Text("Reserve")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 140, height: 40)
                            .background(.pink)
                            .clipShape(RoundedRectangle(cornerRadius:8))
                        
                    }
                }
                .padding(.horizontal,32)
            }
            .background(.white)
        }
    }
}

#Preview {
    ListingDetailView(listing: DeveloperPreview.shared.listings[0])
}
