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
    @State private var showSortOptions = false
    @State private var isTapped = false
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 20) {
                    // Header
                    Text("Client Book Store")
                        .font(.largeTitle)
                        .padding()
                    Button(action: {
                        showSortOptions.toggle()
                    }) {
                        HStack {
                            Image(systemName: "arrow.up.arrow.down")
                                .font(.title)
                            Text("Sort")
                                .font(.headline)
                                .fontWeight(.bold)
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.7)]), startPoint: .leading, endPoint: .trailing))
                        .foregroundColor(.white)
                        .cornerRadius(25)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                    }
                    
                    .actionSheet(isPresented: $showSortOptions) { // Action sheet for sort options
                        ActionSheet(title: Text("Sort By"), buttons: [
                            .default(Text("Name"), action: {
                                // TODO: Implement sorting by name
                            }),
                            .default(Text("Author"), action: {
                                // TODO: Implement sorting by author
                            }),
                            .default(Text("Price"), action: {
                                // TODO: Implement sorting by price
                            }),
                            .cancel()
                        ])
                    }
                    
                    // List of Books
                    ScrollView {
                        LazyVStack(spacing:10) {
                            BookRow()
                            BookRow()
                        }
                    }
                    .listStyle(PlainListStyle())
                    .background(Color.clear)
                    
                    Spacer()
                    
                    // Menu bar with Add and Search buttons
                    VStack {
                        HStack(spacing: 20) { // Adjust the spacing between the buttons as needed
                            NavigationLink(destination: AddBook()) {
                                HStack(spacing: 10) { // Adjust the spacing inside the button
                                    Image(systemName: "plus")
                                        .font(.title2)

                                    Text("Add") // Adds the word "Add" next to the icon
                                        .fontWeight(.semibold) // Optional, for a bolder text
                                }
                                .foregroundColor(.white)
                                .padding(18)
                                .background(
                                    LinearGradient(gradient: Gradient(colors: [Color.orange, Color.red]), startPoint: .leading, endPoint: .trailing)
                                )
                                .cornerRadius(10)
                                .shadow(color: Color.black.opacity(0.25), radius: 8, x: 0, y: 4)
                                .scaleEffect(isTapped ? 0.9 : 1.0)
                                .animation(.easeIn)
                            }

                            NavigationLink(destination: SearchView()) {
                                HStack(spacing: 10) { // Adjust the spacing inside the button
                                    Image(systemName: "magnifyingglass")
                                        .font(.title2)
                                    
                                    Text("Search") // Adds the word "Search" next to the icon
                                        .fontWeight(.semibold) // Optional, for a bolder text
                                }
                                .foregroundColor(.white)
                                .padding(18)
                                .background(
                                    LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.yellow.opacity(0.5)]), startPoint: .leading, endPoint: .trailing)
                                )
                                .cornerRadius(10)
                                .shadow(color: Color.black.opacity(0.25), radius: 8, x: 0, y: 4)
                                .scaleEffect(isTapped ? 0.9 : 1.0)
                                .animation(.easeIn)
                            }
                        }
                        .padding(.horizontal, 10) // Adjust the horizontal padding of the HStack
                        .padding(.bottom, 10)
                    }

                        .padding(.horizontal)
                        .padding(.bottom, 10)
                        
                        
                    }
                    .padding()
                }
                .background(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.green]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all))
            }.onAppear {
                print("hello")
                
                let adapter = FirestoreAdapter()
                
                var book = Book(id: "abc", name: "ksduhgdsk", author: "sdkjgh", price: 123, genre: "sdg")
                
                book.author = "taco"
                
                adapter.addDocument(collectionName: "bla", model: book) { result in
                    print("done")

                }
                print("hello2")

            }
        }
    }

