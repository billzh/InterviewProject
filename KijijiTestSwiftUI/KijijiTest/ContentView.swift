
import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: CategoriesListViewModel = CategoriesListViewModel()
    var body: some View {
        NavigationView {
            CategoriesListView(viewModel: self.viewModel.categories)
            .navigationBarTitle("Categories")
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear {
            self.viewModel.load()
        }
        .alert(isPresented: $viewModel.showAlert) {
            let message = viewModel.error?.localizedDescription ?? "Got network errors!!!"
            return Alert(title: Text("Error"), message: Text(message), dismissButton: .default(Text("OK")))
        }
    }
}
