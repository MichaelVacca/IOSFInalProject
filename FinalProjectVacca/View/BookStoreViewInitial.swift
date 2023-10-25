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
    @State private var isAddedviewActive = false
    @State private var selectedBook: Book?
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.green]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            NavigationStack{
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
                        
                        Button("Add") {
//                            selectedBook = Book(id: 20,name: "New Book", author: "TestAuthor", price: 20.00,genre: "Action")
//                                        }
//                                        .background(
//                                            NavigationLink($selectedBook) { book in
//                                                AddBook(book: book)
//                                            }
//                                        )
//                            .padding()
//                            .background(Color.green)
//                            .foregroundColor(.white)
//                            .cornerRadius(8)
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
                }
                .padding()
            }
        }
    }
}
