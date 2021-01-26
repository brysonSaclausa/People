//
//  PeopleController.swift
//  People
//
//  Created by BrysonSaclausa on 9/23/20.
//

import Foundation


class PeopleController {
    var peopleArray = [Person]()
    let baseURL = URL(string: "https://randomuser.me/api/?results=100")!
    
    
   

    
    init() {
//        let bryson = Person(name: "Bryson")
//        let hector = Person(name: "Hector")
//        [bryson, hector].forEach {
//            peopleArray.append($0)
//        }
        
    }
    
    func fetch(completion: @escaping (Error?) -> ()) {
        URLSession.shared.dataTask(with: baseURL) { (data, _, error) in
            if let error = error {
                completion(error)
            }
            
            guard let data = data else {
                completion(NSError(domain: "fetch error", code: -1, userInfo: nil))
                return
            }
            
//            let jsonString = String(data: data, encoding: .utf8)
//            print(jsonString!)
            
            do {
                let results = try JSONDecoder().decode(UserResults.self, from: data)
                let peopleRepList = results.results
                for personRep in peopleRepList {
                    let person = Person(peronRep: personRep)
                    self.peopleArray.append(person)
                }
            } catch {
                completion(error)
            }
            
            completion(nil)
        }
        .resume()
    }
    
    
}
