//
//  ViewController.swift
//  Todoey
//
//  Created by Nicholas F Forlivio, Sr. on 7/5/19.
//  Copyright © 2019 WhacKdev. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    let itemArray = ["Call Lina", "Code more", "Keep coding"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK - TableView DataSource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoListItem", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedCell = tableView.cellForRow(at: indexPath)
        let selectedCellAccessoryTypeTest = selectedCell?.accessoryType == .checkmark
        
        selectedCell?.accessoryType = selectedCellAccessoryTypeTest ? .none : .checkmark
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}

