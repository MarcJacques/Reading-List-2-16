//
//  BookDetailViewController.swift
//  Reading List
//
//  Created by Spencer Curtis on 7/31/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    var bookController: BookController?
    var book: Book? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var titleTextfield: UITextField!
    
    @IBOutlet weak var reasonTextView: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        if book == nil {
        guard let title = titleTextfield.text,
            let reason = reasonTextView.text,
            !title.isEmpty,
            !reason.isEmpty else { return }
        bookController?.createBookEntry(title: title, reasonToRead: reason, hasBeenRead: false)
        self.navigationController?.title = title
        } else {
            guard let book = book,
            let newTitle = titleTextfield.text,
            let newReason = reasonTextView.text,
            !newTitle.isEmpty,
            !newReason.isEmpty else { return }
            bookController?.editTitleAndReason(book: book, newTitle: newTitle, newReasonToRead: newReason)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateViews(){
        if book != nil {
            titleTextfield.text = book?.title
            reasonTextView.text = book?.reasonToRead
            self.navigationController?.title = "\(book?.title ?? "Invalid Title")"
        } else {
            self.navigationController?.title = "Add a New Book"
            titleTextfield.text = ""
            reasonTextView.text = "Reason to read: "
        }
    }
    
   
    
    
}

