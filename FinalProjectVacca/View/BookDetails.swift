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
    @State private var dataAdded = ""
    @State private var amountInInventory = ""
    @State private var date = Date()
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.green]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Update Book")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .position(x:185 ,y: 100)
                .padding([.top, .leading, .trailing])
                
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
                    
                    Text("Date Added")
                        .font(.callout)
                        .foregroundColor(Color.gray)
                        .padding(.bottom, -5)  // Adjust as needed

                    DatePicker("", selection: $date, displayedComponents: [.date])
                        .datePickerStyle(DefaultDatePickerStyle())
                        .padding(.top, -10)
                        .labelsHidden()

                    
                    // Button to Add the Book
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
        }
        .navigationBarBackButtonHidden(true) // This hides the back button
        .navigationBarHidden(true)
    }
}

