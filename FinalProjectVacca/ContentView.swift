//
//  ContentView.swift
//  FinalProjectVacca
//
//  Created by macuser on 2023-10-25.
//

import SwiftUI

struct BookRow: View {
    var book: Book
    
    var body: some View {
        NavigationLink(destination: navigateToBookDetails()) {
            HStack {
                Text(book.name)
                    .frame(width: 100, alignment: .leading) // Set a fixed width or use a calculated width
                    .lineLimit(1)
                Spacer()
                Text(book.author)
                    .frame(width: 100, alignment: .leading)
                    .lineLimit(1)
                Spacer()
                Text(String(format: "%.2f", book.price))
                    .frame(width: 60, alignment: .trailing)
                    .lineLimit(1)
            }
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
            .padding(.horizontal)
            .padding(.vertical, 5)
        }
    }
    
    
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            BookStoreView()
        }
    }
    private func navigateToBookDetails() -> some View {
        print("Navigating to details of book with ID: \(book.id)")
        return BookDetails(bookID: book.id)
    }
}


struct BookStoreView_Previews: PreviewProvider {
    static var previews: some View {
        BookStoreView()
    }
}

