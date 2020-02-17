//
//  BookTableViewCell.swift
//  Reading List
//
//  Created by Marc Jacques on 2/17/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    var book: Book? {
        didSet {
            //updateViews()
        }
    }
    @IBOutlet weak var checkboxButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    
    
    @IBAction func checkboxButtonTapped(_ sender: UIButton) {
    }
    


    
}
