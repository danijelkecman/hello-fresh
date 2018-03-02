//
//  RecipeCell.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 9/17/17.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import UIKit
import AlamofireImage

protocol RecipeCellFavouriteProtocol: class {
    func didSelectFavouriteWith(recipeId: String, isFavourite: Bool)
    func didChangeRatingFor(recipeId: String, with rating: Int)
}

class RecipeCell: UITableViewCell, NibReusable, RatingControlProtocol {
    
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeNameLabel: UILabel!
    @IBOutlet weak var recipeTimeLabel: UILabel!
    @IBOutlet weak var recipeCaloriesLabel: UILabel!
    @IBOutlet weak var recipeNumberOfPeopleLabel: UILabel!
    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var isFavouriteImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    
    weak var favouriteDelegate: RecipeCellFavouriteProtocol?
    
    private var item: RecipeCellItem!
    private var isFavourite: Bool = false
    
    func configure(with item: RecipeCellItem) {
        self.item = item
        
        recipeNameLabel.text = item.name
        recipeTimeLabel.text = item.time
        recipeCaloriesLabel.text = item.calories
        headlineLabel.text = item.headline
        
        _confgureIsFavouriteImageView()
        _configureFavouriteImage(with: item)
        
        let imageNumber = arc4random_uniform(10)
        let placeholderImage = UIImage(named: String(imageNumber))
        recipeNumberOfPeopleLabel.text = String(imageNumber)
        
        if item.image != nil {
            recipeImageView.image = item.image
        } else {
            recipeImageView.af_setImage(withURL: URL(string: item.imageUrl)!, placeholderImage: placeholderImage) { [weak self] (response) in
                switch response.result {
                case .success(let image):
                    self?.recipeImageView.image = image
                case .failure(let error):
                    log.error("error loading image: \(error)")
                }
            }
            ratingControl.rating = item.rating ?? 0
            ratingControl.ratingDelegate = self
        }
    }
    
    private func _confgureIsFavouriteImageView() {
        // check in presistance if favourite is alrady set otherwise persist it to recipe and make it dirty
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(isFavouriteTapped(tapGestureRecognizer:)))
        isFavouriteImageView.isUserInteractionEnabled = true
        isFavouriteImageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc private func isFavouriteTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        if !isFavourite {
            isFavouriteImageView.image = UIImage(named: "icFavoritesOrange")
            isFavourite = !isFavourite
        } else {
            isFavouriteImageView.image = UIImage(named: "icFavorite")
            isFavourite = !isFavourite
        }
        favouriteDelegate?.didSelectFavouriteWith(recipeId: item.recipeId, isFavourite: isFavourite)
    }
    
    private func _configureFavouriteImage(with item: RecipeCellItem) {
        if !item.isFavouriteSet {
            isFavourite = false
            isFavouriteImageView.image = UIImage(named: "icFavorite")
        } else {
            if item.isFavourite {
                isFavouriteImageView.image = UIImage(named: "icFavoritesOrange")
                isFavourite = true
            } else {
                isFavouriteImageView.image = UIImage(named: "icFavorite")
                isFavourite = false
            }
        }
    }
    
    // Rating Delegate
    
    func didChangeRatingWith(stars: Int) {
        favouriteDelegate?.didChangeRatingFor(recipeId: item.recipeId, with: stars)
    }
}
