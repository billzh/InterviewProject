//
//  URLImage.swift
//  KijijiTest
//
//  Created by Biao Zhang on 2020-02-16.
//  Copyright © 2020 Biao Zhang. All rights reserved.
//

import Foundation
import Combine

final class URLImage: ObservableObject {
    
    @Published var data = Data()
    
    init(imageURL: String) {
        guard let url = URL(string: imageURL) else {
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                return
            }
            DispatchQueue.main.async {
                self.data = data
            }
        }.resume()
    }
}
