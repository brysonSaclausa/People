//
//  Person.swift
//  People
//
//  Created by BrysonSaclausa on 9/23/20.
//

import UIKit

//
class Person {
    let name: String
    let email: String
    let phone: String
    let thumbnailURL: URL
    let mediumURL: URL
    
    var isFavorite = false
    var thumbnailImage: UIImage?
    var mediumImage: UIImage?
    
    init(email: String, phone: String, name: String, thumbnail: URL, medium: URL) {
        self.email = email
        self.phone = phone
        self.name = name
        self.thumbnailURL = thumbnail
        self.mediumURL = medium
    }
    
    convenience init(peronRep: PersonRep) {
        self.init(email: peronRep.email, phone: peronRep.phone, name: peronRep.name, thumbnail: URL(string: peronRep.thumbnail)!, medium: URL(string: peronRep.medium)!)
    
    }
}
