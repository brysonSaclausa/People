//
//  PersonTableViewCell.swift
//  People
//
//  Created by BrysonSaclausa on 10/15/20.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    
    //MARK: - IBOUTLETS
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    
    
    

    var person: Person? {
        didSet {
            configureView()
        }
    }
    
    func configureView() {
        guard let person = person else { return }
        nameLabel.text = person.name
        
        setFavoriteButton(person.isFavorite)
    }
    
    
    @IBAction func likeButtonTapped(_ sender: Any) {
        person?.isFavorite.toggle()
        
        setFavoriteButton(person!.isFavorite)
    }
    
    func setFavoriteButton(_ isFavorite: Bool) {
        let image = UIImage.fetchFavoriteUIImage(isFavorite: isFavorite)
        favoriteButton.setImage(image, for: .normal)
    }
    

}
