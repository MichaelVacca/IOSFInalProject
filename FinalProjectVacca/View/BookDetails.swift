import Foundation
import SwiftUI

struct BookDetails: View {
    @Environment(\.presentationMode) var presentationMode
    @State var book: Book 
    let adapter = FirestoreAdapter()

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.green]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)

            VStack {
                Text("Update Book")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()

                TextField("Book Name", text: $book.name)
                    .textFieldStyle(CustomTextFieldStyle())
                    .padding()

                TextField("Author", text: $book.author)
                    .textFieldStyle(CustomTextFieldStyle())
                    .padding()

                TextField("Price", value: $book.price, formatter: NumberFormatter())
                    .textFieldStyle(CustomTextFieldStyle())
                    .keyboardType(.decimalPad)
                    .padding()

                TextField("Genre", text: $book.genre)
                    .textFieldStyle(CustomTextFieldStyle())
                    .padding()

                HStack {
                    Button("Update Book") {
                        updateBook()
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
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .padding()
                }

                Button("Back") {
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }

    private func updateBook() {
        let updatedFields: [String: Any] = [
            "name": book.name,
            "author": book.author,
            "price": book.price,
            "genre": book.genre
        ]
        
        adapter.updateDocument(collectionName: "books", documentId: book.id, fields: updatedFields) { error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Error updating book: \(error)")
                } else {
                    print("Book updated successfully")
                    self.presentationMode.wrappedValue.dismiss()
                    NotificationCenter.default.post(name: .init("BookListShouldRefresh"), object: nil)
                }
            }
        }
    }
}
