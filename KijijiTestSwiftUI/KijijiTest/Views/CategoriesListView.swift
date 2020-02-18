
import SwiftUI

struct CategoriesListView: View {
    var viewModel: Categories
    var body: some View {
        List(self.viewModel) { category in
            NavigationLink(destination: AdsListView(viewModel: AdsListViewModel(category), categoryName: category.name)) {
               CategoryCell(viewModel: CategoryCellViewModel(category: category))
            }
        }
    }
}

let adCategory = ADCategory(id: 1, name: "ABC", count: 5)

struct CategoriesListView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesListView(viewModel: [adCategory])
    }
}
