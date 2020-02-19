//
//  ReadingListTableViewController.swift
//  Reading List
//
//  Created by Marc Jacques on 2/17/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ReadingListTableViewController : UITableViewController {
    
    let bookController = BookController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    private func bookFor(indexPath: IndexPath) -> Book {
        
        if indexPath.section == 0 {
            return bookController.unreadBooks[indexPath.row]
        } else {
            return bookController.readBooks[indexPath.row]
        }
        
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return bookController.unreadBooks.count
        case 1:
            return bookController.readBooks.count
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as? BookTableViewCell else { return UITableViewCell() }
        
        
        cell.delegate = self
        let book: Book? = bookFor(indexPath: indexPath)
        cell.book = book
        
        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            let bookIndexPath = bookFor(indexPath: indexPath)
            bookController.deleteBookEntry(book: bookIndexPath)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Unread Books"
        } else {
            return "Read Books"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "NewBookSegue" {
            let bookDVC = segue.destination as! BookDetailViewController
            bookDVC.bookController = book
           }
       }
}
    extension ReadingListTableViewController: BookTableViewCellDelegate {
        func toggleHasBeenRead(for cell: BookTableViewCell) {
            
            guard let indexPath = self.tableView.indexPath(for: cell) else { return }
            
            let book: Book = bookFor(indexPath: indexPath)
            bookController.updateHasBeenRead(book: book)
            
            tableView.reloadData()
        }
    }
