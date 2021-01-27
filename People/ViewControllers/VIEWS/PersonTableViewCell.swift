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
        
        if let image = person.thumbnailImage {
            iconImage.image = image
        } else {
            fetchThumbnailImage(url: person.thumbnailURL)
        }
    }
    
    func fetchThumbnailImage(url: URL) {
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print(error)
            }
            
            guard let data = data else {
                return
            }
            
            let image = UIImage(data: data)
            
            DispatchQueue.main.async {
                self.person!.thumbnailImage = image
                self.iconImage!.image = image
            }
            
        }
        .resume()
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
