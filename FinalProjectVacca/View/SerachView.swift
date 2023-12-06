import Foundation
import SwiftUI

struct SearchView: View {
    @State private var searchText: String = ""
    @State private var searchResults: [Book] = []
    let adapter = FirestoreAdapter()
    
    var body: some View {
        ZStack {
            // Gradient Background
            LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.green]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Find a Specific Book")
                    .font(.largeTitle)
                    .padding(.top, 20)
                
                TextField("Search...", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(8)
                    .padding(.horizontal)
                    .onChange(of: searchText) { newValue in
                        searchBooks(query: newValue)
                    }
                    .padding(.top, 20)
                
                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(searchResults, id: \.id) { book in
                            BookRow(book: book)
                        }
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .padding(.horizontal)
                }
            }
        }
    }
    
    private func searchBooks(query: String) {
        adapter.searchBooksByName(query: query) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let books):
                    self.searchResults = books
                case .failure(let error):
                    print("Error searching books: \(error)")

                }
            }
        }
    }
}
