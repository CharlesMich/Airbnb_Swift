//
//  WishListsView.swift
//  airbnb
//
//  Created by Charles Michael on 8/3/24.
//

import SwiftUI

struct WishListsView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing:32){
                VStack(alignment: .leading, spacing: 4) {
                    Text("Log in to view your wishlists")
                        .font(.headline)
                    Text("You can create, view or edit wishlists onve you've logged in")
                        .font(.footnote)
                }
                Button {
                    print("Log in")
                    
                } label : {
                    Text("Log in")
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360, height: 48)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                Spacer()
            }
            .padding()
            .navigationTitle("Wishlist")
        }
       
    }
}

#Preview {
    WishListsView()
}
