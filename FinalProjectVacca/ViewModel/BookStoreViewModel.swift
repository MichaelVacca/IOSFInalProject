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
    
    func fetchData() {
        db.collection("books").getDocuments { (querySnapshot, error) in
            if let querySnapshot = querySnapshot {
                self.books = querySnapshot.documents.compactMap { document -> Book? in
                    try? document.data(as: Book.self)
                }
            }
        }
    }
}

