
import SwiftUI

struct AdsListView: View {
    @ObservedObject var viewModel: AdsListViewModel
    var categoryName: String
    
    var body: some View {
        List(self.viewModel.adsList) { model in
            ADCell(viewModel: AdsListCellModel(model))
        }
        .onAppear(){
            self.viewModel.load()
        }
        .navigationBarTitle(Text(categoryName), displayMode: .inline)
        .alert(isPresented: $viewModel.isShowingAlert) {
                  let message = viewModel.error?.localizedDescription ?? "Got network errors!!!"
                  return Alert(title: Text("Error"), message: Text(message), dismissButton: .default(Text("OK")))
        }
    }
}
