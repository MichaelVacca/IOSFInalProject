//
//  AddBookView.swift
//  FinalProjectVacca
//
//  Created by macuser on 2023-10-25.
//

import Foundation
import SwiftUI
struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.blue, lineWidth: 2) // Adjust color and line width as needed
            )
    }
}

struct AddBook: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var bookName = ""
    @State private var author = ""
    @State private var price = ""
    @State private var genre = ""
    
    var body: some View {
        NavigationView {
            VStack {
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
                
                // Button to Add the Book
                Button("Add Book") {
                    // Save the book to your database or perform other actions here
                    // Example:
                    saveBookToDatabase()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
                .padding()
            }
            .navigationBarTitle("Add Book")
        }
    }
    
    // Function to save the book to the database
    func saveBookToDatabase() {
        // Implement your code to save the book to your database here
        
        // After saving, dismiss the AddBook view and navigate back to the previous view
        self.presentationMode.wrappedValue.dismiss()
    }
}

