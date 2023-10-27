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
                    
                    // Button to Add the Book
                    Button("Add Book") {
                        // You can handle the logic to add the book here
                        
                        // Dismiss the AddBook view and navigate back to the previous view
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
                .navigationBarHidden(true)
                Spacer()
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



