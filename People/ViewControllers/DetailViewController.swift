//
//  DetailViewController.swift
//  People
//
//  Created by BrysonSaclausa on 10/1/20.
//

import UIKit

protocol DetailViewControllerProtocol {
    func favoriteButtonTapped()
}

class DetailViewController: UIViewController {
    var delegate: DetailViewControllerProtocol?
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var emailLabel: UILabel!
    
    //MARK: - PROPERTIES
    var person: Person!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    
    
    func configureViews() {
        guard let person = person else { return }
        nameLabel.text = person.name
        
        setFavoriteButton(person.isFavorite)
        
        emailLabel.text = person.email
    }
    
    @IBAction func favoriteButtonTapped(_ sender: Any) {
        person.isFavorite.toggle()
        delegate?.favoriteButtonTapped()
        // Change system image to Heart.fill
        setFavoriteButton(person.isFavorite)
     }
    
    func setFavoriteButton(_ isFavorite: Bool) {
        let image = UIImage.fetchFavoriteUIImage(isFavorite: isFavorite)
        favoriteButton.setImage(image, for: .normal)
    }
    
 

}
