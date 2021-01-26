//
//  PeopleTableViewController.swift
//  People
//
//  Created by BrysonSaclausa on 9/23/20.
//

import UIKit

class PeopleTableViewController: UITableViewController {
    var peopleController: PeopleController! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        peopleController = PeopleController()
        peopleController.fetch { error in
            if let error = error {
                print(error)
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peopleController.peopleArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath) as!  PersonTableViewCell
        
        let person = peopleController.peopleArray[indexPath.row]
        cell.person = person
        

        
        return cell
    }
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PersonCell" {
            if let detailVC = segue.destination as? DetailViewController, let indexPath = tableView.indexPathForSelectedRow {
                let person = peopleController.peopleArray[indexPath.row]
                detailVC.person = person
                detailVC.delegate = self
            }
        }
    }
    

}
// UITableViewDelegate
extension PeopleTableViewController: DetailViewControllerProtocol {
    func favoriteButtonTapped() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
   

}
