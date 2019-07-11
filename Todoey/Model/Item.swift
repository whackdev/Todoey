//
//  Item.swift
//  Todoey
//
//  Created by Nicholas F Forlivio, Sr. on 7/10/19.
//  Copyright © 2019 WhacKdev. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
