//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Nicholas F Forlivio, Sr. on 7/9/19.
//  Copyright © 2019 WhacKdev. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {
    
    var categoryArray = [Category]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       loadCategories()
    }
    
    //MARK: - TableView DataSource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        
        cell.textLabel?.text = categoryArray[indexPath.row].name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        // What happens when selected
        
    }
    
    //MARK: - Add New Items

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var newCategoryTextField = UITextField()

        let alert = UIAlertController(title: "Add New Todo Category", message: "", preferredStyle: .alert)

        let action = UIAlertAction(title: "Add Category", style: .default) { (action) in


            let newCategory = Category(context: self.context)

            newCategory.name = newCategoryTextField.text

            self.categoryArray.append(newCategory)

            self.saveCategories()
        }

        alert.addAction(action)

        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new category"
            newCategoryTextField = alertTextField
        }

        present(alert, animated: true, completion: nil)
   }
    
    //MARK: - Data Manipulation Methods
    func saveCategories() {
        
        do {
            try context.save()
        } catch {
            print("Error saving context: \(error)")
        }
        
        tableView.reloadData()
    }
    
    func loadCategories() {

        let request: NSFetchRequest<Category> = Category.fetchRequest()

        do {
            categoryArray = try context.fetch(request)
        } catch {
            print("Error loading Categories \(error)")
        }
        tableView.reloadData()
    }
}
