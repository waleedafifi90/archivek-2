//
//  GeneralTableViewData.swift
//  archivek
//
//  Created by Waleed Afifi on 03/02/2020.
//  Copyright © 2020 Waleed Afifi. All rights reserved.
//

import Foundation
import UIKit

class GeneralTableViewData {
    var identifier: String!
    var rowHeight: CGFloat?
    var object: Any?
    
    init(identifier: String, object: Any?, height: CGFloat?) {
        self.identifier = identifier
        self.object = object
        self.rowHeight = height
    }
}
