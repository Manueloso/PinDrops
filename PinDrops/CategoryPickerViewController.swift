//
//  CategoryPickerViewController.swift
//  MyLocations
//
//  Created by manuel on 27/03/24.
//

import UIKit

class CategoryPickerViewController: UITableViewController {
    var selectedCategoryName = ""

    let categories = [
        "No Category",
        "Apple Store",
        "Bar",
        "Bookstore",
        "Club",
        "Coffee Shop",
        "Grocery Store",
        "Gym/Fitness Center",
        "Historic Building",
        "Hospital/Clinic",
        "House",
        "Icecream Vendor",
        "Landmark",
        "Park",
        "Movie Theater",
        "Museum",
        "Pharmacy",
        "Bank/ATM",
        "Hotel",
        "School/University",
        "Gas Station",
        "Airport",
        "Beach",
        "Mountain/Peak",
        "Lake/River",
        "Shopping Mall",
        "Stadium/Arena",
        "Zoo/Aquarium",
        "Amusement Park",
        "Concert Venue"
    ]
    
    var selectedIndexPath = IndexPath()

    override func viewDidLoad() {
        super.viewDidLoad()

        for i in 0..<categories.count {
            if categories[i] == selectedCategoryName {
                selectedIndexPath = IndexPath(row: i, section: 0)
                break
            }
        }
    }

    // MARK: - Table View Delegates
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let categoryName = categories[indexPath.row]
        cell.textLabel!.text = categoryName

        if categoryName == selectedCategoryName {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row != selectedIndexPath.row {
            if let newCell = tableView.cellForRow(at: indexPath) {
                newCell.accessoryType = .checkmark
            }
            if let oldCell = tableView.cellForRow(at: selectedIndexPath) {
                oldCell.accessoryType = .none
            }
            selectedIndexPath = indexPath
        }
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PickedCategory" {
            let cell = sender as! UITableViewCell
            if let indexPath = tableView.indexPath(for: cell) {
                selectedCategoryName = categories[indexPath.row]
            }
        }
    }
}
