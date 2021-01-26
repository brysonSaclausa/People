//
//  UIImage+setFavorite.swift
//  People
//
//  Created by BrysonSaclausa on 1/13/21.
//

import Foundation
import UIKit

fileprivate let heartSystemImage = "hand.thumbsup"//"heart"

extension UIImage {
    
    static func fetchFavoriteUIImage(isFavorite: Bool) -> UIImage {
        let imageName = (isFavorite) ? (heartSystemImage + ".fill") : (heartSystemImage)
        
        guard let image = UIImage(systemName: imageName) else { fatalError("fetchFavoriteUIImage")
        }
        
        return image
    }
}
