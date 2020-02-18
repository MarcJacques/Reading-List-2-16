//
//  BookTableViewCell.swift
//  Reading List
//
//  Created by Marc Jacques on 2/17/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    var book: Book?
    
    @IBOutlet weak var checkboxButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    var delegate: BookTableViewCellDelegate?
    
    func updateViews() {
        titleLabel.text = book?.title
        let checked = UIImage(named: "checked") as UIImage?
        let unchecked = UIImage(named: "unchecked") as UIImage?
        if book?.hasBeenRead == true {
            checkboxButton.setImage(checked, for: .normal)
        } else {
            checkboxButton.setImage(unchecked, for: .normal)
        }
    }
    
    
    @IBAction func checkboxButtonTapped(_ sender: UIButton) {
        delegate?.toggleHasBeenRead(for: self)
    }
    


    
}
