//
//  Item.swift
//  Todoey
//
//  Created by Nicholas F Forlivio, Sr. on 7/8/19.
//  Copyright © 2019 WhacKdev. All rights reserved.
//

import Foundation

class Item: Codable {
    var done = false
    var title : String
    
    init(_ text: String) {
        title = text
    }

}
