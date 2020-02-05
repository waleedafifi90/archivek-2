//
//  GeneralCollectionViewData.swift
//  archivek
//
//  Created by Waleed Afifi on 03/02/2020.
//  Copyright © 2020 Waleed Afifi. All rights reserved.
//

import Foundation
import UIKit

class GeneralCollectionViewData {
    var identifier: String!
    var cellSize: CGSize?
    var object: Any?
    
    init(identifier: String, object: Any?, cellSize: CGSize?) {
        self.identifier = identifier
        self.object = object
        self.cellSize = cellSize
    }
}
