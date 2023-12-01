//
//  BookDetails.swift
//  FinalProjectVacca
//
//  Created by MACUSER on 2023-10-26.
//

import Foundation
import SwiftUI

struct BookDetails: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var bookName = ""
    @State private var author = ""
    @State private var price = ""
    @State private var genre = ""
    var bookID: String

    let adapter = FirestoreAdapter()

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.green]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)

            VStack {
                Text("Update Book")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding([.top, .leading, .trailing])

                // Book Name
                TextField("Book Name", text: $bookName)
                    .textFieldStyle(CustomTextFieldStyle())
                    .padding()

                // Author
                TextField("Author", text: $author)
                    .textFieldStyle(CustomTextFieldStyle())
                    .padding()

                // Price
                TextField("Price", text: $price)
                    .textFieldStyle(CustomTextFieldStyle())
                    .padding()

                // Genre
                TextField("Genre", text: $genre)
                    .textFieldStyle(CustomTextFieldStyle())
                    .padding()

                    HStack {
                        Button("Update Book") {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .padding()
                
                        Button("Delete Book") {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .padding()
                    }
                
                    Button("Back") {
                        self.presentationMode.wrappedValue.dismiss()
                    }
            }
        }
        .onAppear {
            loadBookDetails()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }

    private func loadBookDetails() {
        adapter.fetchBookByID(bookID) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let fetchedBook):
                    self.bookName = fetchedBook.name
                    self.author = fetchedBook.author
                    self.price = String(fetchedBook.price)
                    self.genre = fetchedBook.genre
                case .failure(let error):
                    print("Error fetching book: \(error)")
                    // Handle the error appropriately
                }
            }
        }
    }
}



