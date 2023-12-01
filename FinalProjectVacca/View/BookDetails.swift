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
    @State private var book: Book?
    var bookID: String
    let adapter = FirestoreAdapter()
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.green]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text(book?.name ?? "Update Book")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding([.top, .leading, .trailing])

                if let book = book {
                    // Book Name
                    TextField("Book Name", text: Binding(
                        get: { book.name },
                        set: { book.name = $0 }
                    ))
                    .textFieldStyle(CustomTextFieldStyle())
                    .padding()

                    // Author
                    TextField("Author", text: Binding(
                        get: { book.author },
                        set: { book.author = $0 }
                    ))
                    .textFieldStyle(CustomTextFieldStyle())
                    .padding()

                    // Price
                    TextField("Price", value: Binding(
                        get: { book.price },
                        set: { book.price = $0 }
                    ), formatter: NumberFormatter())
                    .textFieldStyle(CustomTextFieldStyle())
                    .padding()

                    // Genre
                    TextField("Genre", text: Binding(
                        get: { book.genre },
                        set: { book.genre = $0 }
                    ))
                    .textFieldStyle(CustomTextFieldStyle())
                    .padding()
                    
                    Text("Date Added")
                        .font(.callout)
                        .foregroundColor(Color.gray)
                        .padding(.bottom, -5)  // Adjust as needed

//                    DatePicker("", selection: $date, displayedComponents: [.date])
//                        .datePickerStyle(DefaultDatePickerStyle())
//                        .padding(.top, -10)
//                        .labelsHidden()

                    
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

