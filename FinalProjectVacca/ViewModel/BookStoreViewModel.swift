//
//  BookStoreViewModel.swift
//  FinalProjectVacca
//
//  Created by macuser on 2023-10-25.
//

import Foundation
import Firebase
import FirebaseFirestore


class BookStoreViewModel: ObservableObject {
    @Published var books: [Book] = []

    private var db = Firestore.firestore()
    
    init(){
        fetchData()
    }
    func sortByName() {
        books.sort { $0.name < $1.name }
    }

    func sortByAuthor() {
        books.sort { $0.author < $1.author }
    }

    func sortByPrice() {
        books.sort { $0.price < $1.price }
    }
    
    func fetchData() {
        db.collection("books").getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
                return
            }

            if let querySnapshot = querySnapshot {
                self.books = querySnapshot.documents.compactMap { document -> Book? in
                    var book = try? document.data(as: Book.self)
                    book?.id = document.documentID
                    print("ViewModel id:")
                    return book
                }
            }
        }
    }
}

