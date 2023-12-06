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
    
    func fetchData() {
        db.collection("books").getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
                return
            }

            if let querySnapshot = querySnapshot {
                for document in querySnapshot.documents {
                    print("\(document.documentID) => \(document.data())")
                }

                self.books = querySnapshot.documents.compactMap { document -> Book? in
                    return try? document.data(as: Book.self)
                }
            }
        }
    }

}

