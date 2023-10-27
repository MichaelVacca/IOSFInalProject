//
//  ContentView.swift
//  FinalProjectVacca
//
//  Created by macuser on 2023-10-25.
//

import SwiftUI

struct BookRow: View {
    var body: some View {
        NavigationLink(destination: BookDetails()) {
            HStack {
                Text("ID").lineLimit(1)
                Text("Harry").lineLimit(1)
                Text("Author").lineLimit(1)
                Text("Price").lineLimit(1)
                Text("Genre").lineLimit(1)
            }
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
            .padding(.horizontal)
            .padding(.vertical, 5)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BookStoreView()
    }
}

struct BookStoreView_Previews: PreviewProvider {
    static var previews: some View {
        BookStoreView()
    }
}

