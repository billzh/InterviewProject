import SwiftUI

struct CategoryCell: View {
    var viewModel: CategoryCellViewModel
    
    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 10) {
            Text(viewModel.getCategoryName())
            Text(viewModel.getCategoryCountString())
        }
    }
}
