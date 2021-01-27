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
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var phoneLabel: UILabel!
    
    //MARK: - PROPERTIES
    var person: Person!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    
    
    func configureViews() {
        guard let person = person else { return }
        nameLabel.text = person.name
        phoneLabel.text = person.phone
        
        setFavoriteButton(person.isFavorite)
        
        emailLabel.text = person.email
        
        if let image = person.mediumImage {
            imageView.image = image
        } else {
            fetchImage(url: person.mediumURL)
        }
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
    
    func fetchImage(url: URL) {
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print(error)
            }
            
            guard let data = data else {
                return
            }
            
            let image = UIImage(data: data)
            
            DispatchQueue.main.async {
                self.person.mediumImage = image
                self.imageView.image = image
            }
            
        }
        .resume()
    }
        
}
    

