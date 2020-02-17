//
//  CategoryCellModel.swift
//  KijijiTest
//
//  Created by Biao Zhang on 2020-02-16.
//  Copyright © 2020 Biao Zhang. All rights reserved.
//

import Foundation
import Combine

struct CategoryCellViewModel {
    private var category: ADCategory
    
    init(category: ADCategory) {
        self.category = category
    }
    
    func getCategoryID() -> String {
        return String(category.id)
    }
    
    func getCategoryName() -> String {
        return category.name
    }
    
    func getCategoryCountString() -> String {
        return String(category.count)
    }
}
