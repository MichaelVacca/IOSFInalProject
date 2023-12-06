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
                    
                    .actionSheet(isPresented: $showSortOptions) {
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
                    HStack {
                        Text("Book Name")
                            .fontWeight(.bold)
                            .frame(width: 100, alignment: .leading)
                        Spacer()
                        Text("Author")
                            .fontWeight(.bold)
                            .frame(width: 100, alignment: .leading)
                        Text("Price")
                            .fontWeight(.bold)
                            .frame(width: 60, alignment: .trailing)
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 5)

                    ScrollView {
                        LazyVStack(spacing: 0) {
                            ForEach(viewModel.books) { book in
                                BookRow(book: book)
                            }
                        }
                    }
                    .listStyle(PlainListStyle())
                    .background(Color.clear)
                    
                    Spacer()
                    
                    VStack {
                        HStack(spacing: 20) {
                            NavigationLink(destination: AddBook()) {
                                HStack(spacing: 10) {
                                    Image(systemName: "plus")
                                        .font(.title2)

                                    Text("Add")
                                        .fontWeight(.semibold)
                                }
                                .foregroundColor(.white)
                                .padding(18)
                                .background(
                                    LinearGradient(gradient: Gradient(colors: [Color.orange, Color.red]), startPoint: .leading, endPoint: .trailing)
                                )
                                .cornerRadius(10)
                                .shadow(color: Color.black.opacity(0.25), radius: 8, x: 0, y: 4)
                                .scaleEffect(isTapped ? 0.9 : 1.0)
                            }

                            NavigationLink(destination: SearchView()) {
                                HStack(spacing: 10) {
                                    Image(systemName: "magnifyingglass")
                                        .font(.title2)
                                    
                                    Text("Search")
                                        .fontWeight(.semibold)
                                }
                                .foregroundColor(.white)
                                .padding(18)
                                .background(
                                    LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.yellow.opacity(0.5)]), startPoint: .leading, endPoint: .trailing)
                                )
                                .cornerRadius(10)
                                .shadow(color: Color.black.opacity(0.25), radius: 8, x: 0, y: 4)
                                .scaleEffect(isTapped ? 0.9 : 1.0)
                            }
                        }
                        .padding(.horizontal, 10)
                        .padding(.bottom, 10)
                    }

                        .padding(.horizontal)
                        .padding(.bottom, 10)
                        
                        
                    }
                    .padding()
                }
                .background(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.green]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all))
            }.onReceive(NotificationCenter.default.publisher(for: .init("BookListShouldRefresh"))) { _ in
                viewModel.fetchData()
            }

            .onAppear {
                viewModel.fetchData()
                print("Fetching data in Initial View")
                print("hello")
                
                let adapter = FirestoreAdapter()
                
                var book = Book(id: "def", name: "helloFirebase?", author: "sdkjgh", price: 123, genre: "sdg")
                
                book.author = "taco"
                
                adapter.addDocument(collectionName: "bla", model: book) { result in
                    print("done")

                }
                print("hello2")

            }.onReceive(NotificationCenter.default.publisher(for: NSNotification.Name("BookListShouldRefresh"))) { _ in
                viewModel.fetchData()
            }
        
        }
    }



