//
//  ListingImageCarouselView.swift
//  airbnb
//
//  Created by Charles Michael on 7/25/24.
//

import SwiftUI

struct ListingImageCarouselView: View {
    
//    var images = [
//    "listing-1",
//    "listing-2",
//    "listine-3",
//    "listing-4",
//    ]
    
    let listing: Listing
    
    var body: some View {
        TabView {
            ForEach(listing.imageURLs, id: \.self){ image in
               Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }
//            .frame(height: 320)
        
//                .clipShape(RoundedRectangle(cornerRadius: 10))
                .tabViewStyle(.page)
    }
}

#Preview {
    ListingImageCarouselView(listing: DeveloperPreview.shared.listings[0])
}
