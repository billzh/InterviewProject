
import SwiftUI

struct AdsListView: View {
    @ObservedObject var viewmodel: AdsListViewModel
    var categoryName: String
    
    var body: some View {
        List(self.viewmodel.adsList) { model in
            ADCell(viewModel: AdsListCellModel(model))
        }
        .onAppear(){
            self.viewmodel.load()
        }
        .navigationBarTitle(Text(categoryName), displayMode: .inline)
    }
}
