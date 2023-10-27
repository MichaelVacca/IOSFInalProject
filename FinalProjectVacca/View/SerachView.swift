import SwiftUI

struct SearchView: View {
    @State private var searchText: String = ""
    
    var body: some View {
        ZStack {
            // Gradient Background
            LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.green]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                VStack {
                    // Title
                    Text("Find a Specific Book")
                        .font(.largeTitle)
                        .padding(.top, 20)
                    // Search Bar
                    HStack {
                        TextField("Search...", text: $searchText)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(10)
                            .background(Color.white)
                            .cornerRadius(8)
                            .padding(.horizontal)
                    }
                    .padding(.top, 20)
                    
                    // ScrollView with dim gray background
                    ScrollView {
                        VStack(spacing: 10) {
                            // Sample rows for the ScrollView
                            Text("Book 1")
                            Text("Book 2")
                            Text("Book 3")
                        }
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}
