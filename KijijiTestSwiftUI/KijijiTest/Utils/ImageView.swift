//
//  ImageView.swift
//  KijijiTest
//
//  Created by Biao Zhang on 2020-02-16.
//  Copyright © 2020 Biao Zhang. All rights reserved.
//

import SwiftUI

struct ImageView: View {
    @ObservedObject var imageData: URLImage
    var placeholder: UIImage = UIImage(imageLiteralResourceName: "placeholder")
    
    init(imageURL: String, placeholder: UIImage?) {
        imageData = URLImage(imageURL: imageURL)
        if let image = placeholder {
            self.placeholder = image
        }
    }
    
    var body: some View {
        Image(uiImage: imageData.data.isEmpty ? placeholder : UIImage(data: imageData.data) ?? placeholder)
        .resizable()
        .frame(width: 100, height: 100, alignment: .center)
        .aspectRatio(contentMode: .fit)
    }
}
