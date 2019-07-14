//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Nicholas F Forlivio, Sr. on 7/9/19.
//  Copyright © 2019 WhacKdev. All rights reserved.
//

import UIKit
import RealmSwift
import ChameleonFramework

class CategoryViewController: SwipeTableViewController {
    
    let realm = try! Realm()
    
    var categories: Results<Category>?
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCategories()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        guard let navBar = navigationController?.navigationBar else {fatalError("Navigation Controller not found")}
        
        navBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.flatWhite()!]
    }
    //MARK: - TableView DataSource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        
        if let category = categories?[indexPath.row] {
            cell.textLabel?.text = category.name
            cell.backgroundColor = UIColor(hexString: category.cellBackgroundColor)
            
        } else {
            cell.textLabel?.text = "No Categories Added Yet"
            cell.backgroundColor = UIColor(hexString: "1D98F6")
        }
        
        cell.textLabel?.textColor = UIColor.init(contrastingBlackOrWhiteColorOn: cell.backgroundColor, isFlat: true)
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "goToItems", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories?[indexPath.row]
        }
    }
    
    //MARK: - Add New Items

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var newCategoryTextField = UITextField()

        let alert = UIAlertController(title: "Add New Todo Category", message: "", preferredStyle: .alert)

        let action = UIAlertAction(title: "Add Category", style: .default) { (action) in


            let newCategory = Category()

            newCategory.name = newCategoryTextField.text!
            newCategory.cellBackgroundColor = UIColor.randomFlat().hexValue()

            self.save(category: newCategory)
        }

        alert.addAction(action)

        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new category"
            newCategoryTextField = alertTextField
        }

        present(alert, animated: true, completion: nil)
   }
    
    //MARK: - Data Manipulation Methods
    func save(category: Category) {
        
        do {
            try realm.write {
                realm.add(category)
            }
        } catch {
            print("Error saving context: \(error)")
        }
        
        tableView.reloadData()
    }
    
    func loadCategories() {

        categories = realm.objects(Category.self)
        
        tableView.reloadData()
    }
    
    override func updateModel(at indexPath: IndexPath) {
        if let categoryForDeletion = self.categories?[indexPath.row] {
            do {
                try self.realm.write {
                    self.realm.delete(categoryForDeletion)
                }
            } catch {
                print("Error deleting category \(error)")
            }
        }
    }
}


