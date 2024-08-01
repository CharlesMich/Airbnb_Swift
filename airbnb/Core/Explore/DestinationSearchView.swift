//
//  DestinationSearchView.swift
//  airbnb
//
//  Created by Charles Michael on 8/1/24.
//

import SwiftUI

struct DestinationSearchView: View {
    @Binding var show: Bool
    @State private var destination = ""
    var body: some View {
        VStack {
            Button {
                withAnimation(.snappy) {
                    show.toggle()
                }
               
            } label:{
                Image(systemName: "xmark.circle")
                    .imageScale(.large)
                    .foregroundStyle(.black)
            }
            VStack(alignment: .leading){
                Text("where to?")
                    .font(.title2)
                    .fontWeight(.semibold)
                HStack {
                    Image(systemName: "magnifyingglass")
                        .imageScale(.small)
                    TextField("Search Destination", text:$destination)
                        .font(.subheadline)
                }
                .frame(height:44)
                .padding(.horizontal)
                .overlay {
                    RoundedRectangle(cornerRadius: 8.0)
                        .stroke(lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                        .foregroundStyle(Color(.systemGray4))
                }
            }
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius:10)
        }
        
//        data selection view
        VStack{
            HStack {
                Text("when")
                    .foregroundStyle(.gray)
                Spacer()
                
                Text("Add dates")
            }
            .fontWeight(.semibold)
            .font(.subheadline)
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding()
        .shadow(radius:10)
        
//        num selection view
        VStack{
            HStack {
                Text("who")
                    .foregroundStyle(.gray)
                Spacer()
                
                Text("Add guests")
            }
            .fontWeight(.semibold)
            .font(.subheadline)
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding()
        .shadow(radius:10)
    }
}

#Preview {
    DestinationSearchView(show: .constant(false))
}

struct ExtractedView: View {
    let title: String
    let descriptionL: String
    var body: some View {
        VStack{
            HStack {
                Text("who")
                    .foregroundStyle(.gray)
                Spacer()
                
                Text("Add guests")
            }
            .fontWeight(.semibold)
            .font(.subheadline)
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding()
        .shadow(radius:10)
    }
}
