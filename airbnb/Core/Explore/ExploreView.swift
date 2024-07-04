//
//  ExploreView.swift
//  airbnb
//
//  Created by Charles Michael on 7/4/24.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(0 ... 10, id: \.self) {listing in
                        Rectangle()
                            .frame(height: 400)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    ExploreView()
}
