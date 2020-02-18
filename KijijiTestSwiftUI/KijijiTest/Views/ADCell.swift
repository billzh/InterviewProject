//
//  ADCell.swift
//  KijijiTest
//
//  Created by Biao Zhang on 2020-02-16.
//  Copyright © 2020 Biao Zhang. All rights reserved.
//

import SwiftUI

struct ADCell: View {
    var viewModel: AdsListCellModel
    
    var body: some View {
        HStack(spacing: 10){
            ImageView(imageURL: viewModel.getImageUrlString(), placeholder: nil)
            VStack(alignment:.center) {
                Text(viewModel.getTitle())
                Text(viewModel.getPrice())
            }
        }
       
    }
}
