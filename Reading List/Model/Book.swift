//
//  Book.swift
//  Reading List
//
//  Created by Marc Jacques on 2/16/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
struct Book: Equatable, Codable {
    var title: String
    var reasonToRead: String
    var hasBeenRead: Bool
    
    init(title: String, reasonToRead: String, hasbeenRead: Bool) {
        self.title = title
        self.reasonToRead = reasonToRead
        self.hasBeenRead = false
        
    }
}


