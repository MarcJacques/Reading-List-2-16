//
//  BookTableViewCellDelegate.swift
//  Reading List
//
//  Created by Marc Jacques on 2/17/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
protocol BookTableViewCellDelegate {
    func toggleHasBeenRead(for cell: BookTableViewCell)
}
