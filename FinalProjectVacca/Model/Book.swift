//
//  Book.swift
//  FinalProjectVacca
//
//  Created by macuser on 2023-10-25.
//

import Foundation

struct Book: Codable ,Identifiable{
    var id: String
    var name: String
    var author: String
    var price: Double
    var genre: String
}
