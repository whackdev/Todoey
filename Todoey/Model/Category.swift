//
//  Category.swift
//  Todoey
//
//  Created by Nicholas F Forlivio, Sr. on 7/10/19.
//  Copyright © 2019 WhacKdev. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
}
