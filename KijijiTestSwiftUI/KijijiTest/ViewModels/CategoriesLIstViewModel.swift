//
//  CategoriesLIstViewModel.swift
//  KijijiTest
//
//  Created by Biao Zhang on 2020-02-16.
//  Copyright © 2020 Biao Zhang. All rights reserved.
//

import Foundation
import Combine

struct AppConstants {
    static let urlString: String = "https://ios-interview.surge.sh/categories"
}


public class CategoriesListViewModel: ObservableObject {
    @Published var categories: Categories = [ADCategory]()
    var error: Error?
    @Published var showAlert = false
    
    func load() {
        guard let url = URL(string: AppConstants.urlString) else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil {
                 DispatchQueue.main.async {
                    self.error = error
                    self.showAlert = true
                }
            } else {
                do {
                    guard let data = data else { return }
                    let list = try JSONDecoder().decode([ADCategory].self, from: data)
                    DispatchQueue.main.async {
                        self.categories = list
                        self.error = nil
                        self.showAlert = false
                    }
                } catch {
                    DispatchQueue.main.async {
                        self.error = error
                        self.showAlert = true
                    }
                }
            }
        }.resume()
    }
}
