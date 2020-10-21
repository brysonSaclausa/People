//
//  PersonTableViewCell.swift
//  People
//
//  Created by BrysonSaclausa on 10/15/20.
//

import UIKit

class PersonTableViewCell: UITableViewCell {

    var person: Person? {
        didSet {
            configureView()
        }
    }
    
    func configureView() {
        
    }
    

}
