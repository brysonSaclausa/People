//
//  PeopleController.swift
//  People
//
//  Created by BrysonSaclausa on 9/23/20.
//

import Foundation


class PeopleController {
    var peopleArray = [Person]()
    
    init() {
        let bryson = Person(name: "Bryson")
        let hector = Person(name: "Hector")
        [bryson, hector].forEach {
            peopleArray.append($0)
        }
        
    }
    
    
}
