//
//  Person.swift
//  People
//
//  Created by BrysonSaclausa on 9/23/20.
//

import Foundation

//
class Person {
    let name = "full name"
    let email: String
    let phone: String
    
//    let name: String
    var isFavorite = false
    
    init(email: String, phone: String) {
        self.email = email
        self.phone = phone
    }
    
    convenience init(peronRep: PersonRep) {
        self.init(email: peronRep.email, phone: peronRep.phone)
    
    }
}
