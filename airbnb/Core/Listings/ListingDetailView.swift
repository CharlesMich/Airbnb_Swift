//
//  ListingDetailView.swift
//  airbnb
//
//  Created by Charles Michael on 7/25/24.
//

import SwiftUI

struct ListingDetailView: View {
    var images = [
    "listing-1",
    "listing-2",
    "listine-3",
    "listing-4",
    ]
    var body: some View {
        ScrollView {
            ListingImageCarouselView()
                .frame(height:320)
            
            VStack(alignment: .leading, spacing: 0){
                Text("Miami VIlla")
                    .font(.title)
                    .fontWeight(.semibold)
                
                VStack(alignment: .leading){
                    HStack(spacing: 2) {
                       
                            Image(systemName: "star.fill")
                        Text("4.86")
                        }
                    .foregroundStyle(.black)
                    }
            }
        }
    }
}

#Preview {
    ListingDetailView()
}
