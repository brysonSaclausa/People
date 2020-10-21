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
    
    let heartSystemImage = "heart"
    
    
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
    }
    
    @IBAction func favoriteButtonTapped(_ sender: Any) {
        person.isFavorite.toggle()
        delegate?.favoriteButtonTapped()
        // Change system image to Heart.fill
        setFavoriteButton(person.isFavorite)
     }
    
    func setFavoriteButton(_ isFavorite: Bool) {
//        var imageName = heartSystemImage
//
//        if isFavorite == true  {
//           // imageName = imageName + ".fill"
//            imageName += ".fill"
//        } else {
//            imagename = heartImage
//            }
        
        var imageName = isFavorite ? heartSystemImage + ".fill" : heartSystemImage
        
        
        let heartImage = UIImage(systemName: imageName)
        favoriteButton.setImage(heartImage, for: .normal)
    }
    
 

}
