//
//  SwipeTableViewController.swift
//  Todoey
//
//  Created by Nicholas F Forlivio, Sr. on 7/11/19.
//  Copyright © 2019 WhacKdev. All rights reserved.
//

import UIKit
import SwipeCellKit
import ChameleonFramework

class SwipeTableViewController: UITableViewController, SwipeTableViewCellDelegate {
    
    var cell: UITableViewCell?
    var cellBackgroundColorString: String? {
        didSet {
                cell?.backgroundColor = UIColor(hexString: cellBackgroundColorString)
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 80
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SwipeTableViewCell
        
        currentCell.delegate = self
        cell = currentCell
        return currentCell
    }

    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        
        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { (action, indexPath) in
            
            print("Delete action triggered.")
            self.updateModel(at: indexPath)
        }
        
        deleteAction.image = UIImage(named: "delete")
        
        return [deleteAction]
    }
    
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .destructive
        
        return options
    }
    
    func updateModel(at indexPath: IndexPath) {
        // Sub classes call data model updates here
    }
    
    func updateCellBackground(colorString: String? ) {
        cellBackgroundColorString = colorString ?? UIColor.randomFlat()!.hexValue()
    }
    
}
