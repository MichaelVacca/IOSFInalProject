//
//  BookStoreViewModel.swift
//  FinalProjectVacca
//
//  Created by macuser on 2023-10-25.
//

import Foundation

class BookStoreViewModel: ObservableObject{
    @Published var books : [Book] = []

    private var adapter = FirestoreAdapter()

    // Fetch all books
    func fetchBooks() {
        // Use adapter to fetch books and update `books` array
    }

    // Add a book
    func addBook(_ book: Book) {
        adapter.addDocument(collectionName: "books", model: book) { result in
            // Handle result (success or failure)
        }
    }

    // Update a book
    func updateBook(_ book: Book) {
        // Update book details
    }

    // Delete a book
    func deleteBook(withId id: String) {
        // Delete the book
    }
    
}
