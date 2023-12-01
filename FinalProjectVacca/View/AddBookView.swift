//
//  AddBookView.swift
//  FinalProjectVacca
//
//  Created by macuser on 2023-10-25.
//

import Foundation
import SwiftUI

struct AddBook: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var bookName = ""
    @State private var author = ""
    @State private var price = ""
    @State private var genre = ""
    @State private var date = Date()
    @State private var amountInInventory = ""
    let adapter = FirestoreAdapter()

    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.green]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Add Book")
                    .font(.largeTitle)   // Making the title larger
                    .foregroundColor(.white)
                    .padding([.top, .leading, .trailing])
                
                VStack {
                    // Book Name
                    TextField("Book Name", text: $bookName)
                        .textFieldStyle(CustomTextFieldStyle())
                        .background(Color.clear)
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
                    Button("Add Book") {
                        self.addBookToFirebase()
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .padding()
                }
                Button("Back") {
                    self.presentationMode.wrappedValue.dismiss()
                }.onDisappear {
                    // Post a notification when the view disappears
                    NotificationCenter.default.post(name: NSNotification.Name("BookListShouldRefresh"), object: nil)
                }
                .navigationBarHidden(true)
                Spacer()
            }
        }
    }
    private func addBookToFirebase() {
        // First, validate the input to ensure it's correct
        guard let priceNumber = Double(price), !bookName.isEmpty, !author.isEmpty, !genre.isEmpty else {
            print("Invalid input")
            // Handle the invalid input with an alert or a message to the user
            return
        }

        // Create a new book instance
        let newBook = Book(id: UUID().uuidString, name: bookName, author: author, price: priceNumber, genre: genre)
        
        // Add the new book to Firestore using the FirestoreAdapter
        adapter.addDocument(collectionName: "books", model: newBook) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let documentReference):
                    print("Book added successfully with ID: \(documentReference.documentID)")
                    // Dismiss the AddBook view or show success feedback
                    self.presentationMode.wrappedValue.dismiss()
                case .failure(let error):
                    print("Error adding book: \(error.localizedDescription)")
                    // Show error feedback to the user
                }
            }
        }
    }
}



struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: Color.gray.opacity(0.4), radius: 3, x: 0, y: 2)
    }
}



