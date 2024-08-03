//
//  MainTabView.swift
//  airbnb
//
//  Created by Charles Michael on 8/3/24.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            ExploreView()
                .tabItem { Label("Explore", systemImage:"magnifyingglass") }
            WishListsView()
                .tabItem { Label("Wishlist", systemImage:"heart") }
            ProfileView()
                .tabItem { Label("Profile", systemImage:"person") }
        }
    }
}

#Preview {
    MainTabView()
}
