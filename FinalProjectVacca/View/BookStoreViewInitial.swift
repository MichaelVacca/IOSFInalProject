//
//  BookStoreViewInitial.swift
//  FinalProjectVacca
//
//  Created by macuser on 2023-10-25.
//

import Foundation
import SwiftUI


struct BookStoreView: View {
    @ObservedObject var viewModel = BookStoreViewModel()
    @State private var isAddBookViewActive = false
    @State private var navigateToSearch = false
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack(spacing: 20) {
                    // Header
                    Text("Client Book Store")
                        .font(.largeTitle)
                        .padding()
                    
                    // Sort and Add Book Buttons
                    HStack(spacing: 20) {
                        Button("Sort") {
                            // Sort action
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        
                        NavigationLink(destination: AddBook()) {
                            Text("Add Book")
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                    
                    // List of Books
                    ScrollView{
                        LazyVStack(spacing:10){
                            BookRow()
                            BookRow()
                        }
                    }
                    .listStyle(PlainListStyle())
                    .background(Color.clear)
                    Spacer() 
                    
                    NavigationLink(destination: SearchView()) {
                        Text("Find Specific Book") 
                            
                        
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .padding(.bottom)
                    }
                }
                .padding()
            }
            .background(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.green]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all))
        }
    }
}
