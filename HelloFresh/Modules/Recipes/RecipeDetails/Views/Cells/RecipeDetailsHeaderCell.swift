//
//  RecipeDetailsHeaderTableViewCell.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 10/9/15.
//  Copyright © 2015 CxRomos. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

protocol RecipeDetailsHeaderProtocol: class {
  func favouriteTapped(recipe: Recipe)
}

class RecipeDetailsHeaderCell: UITableViewCell, NibReusable {
  
  @IBOutlet weak var headerImageView: UIImageView!
  @IBOutlet weak var recipeNameLabel: UILabel!
  @IBOutlet weak var recipeIngredientsLabel: UILabel!
  @IBOutlet weak var likeButton: UIButton!
  
  weak var recipeDetailsDelegate: RecipeDetailsHeaderProtocol?
  
  var recipe: Recipe!
  
  func configure(with recipe: Recipe?) {
    guard let recipe = recipe else { return }
    self.recipe = recipe
    setupRecipeName(recipe)
    setupIngredients(recipe)
    setupHeaderImage(recipe.thumb)
    setupFavoriteStatus()
  }
  
  // setup header image from teh thum part of recipe
  fileprivate func setupHeaderImage(_ thumb: String?) {
    let imageNumber = arc4random_uniform(10)
    let placeholderImage = UIImage(named: String(imageNumber))
    
    headerImageView.af_setImage(withURL: URL(string: recipe.image)!, placeholderImage: placeholderImage) { [weak self] (response) in
      switch response.result {
      case .success(let image):
        self?.headerImageView.image = image
      case .failure(let error):
        log.error("error loading image: \(error)")
      }
    }
  }
  
  // scale image to the size of the image view
  func imageAspectScaledToFillSize(_ size: CGSize, image: UIImage) -> UIImage {
    let imageAspectRatio = image.size.width / image.size.height
    let canvasAspectRatio = size.width / size.height
    
    var resizeFactor: CGFloat
    
    if imageAspectRatio > canvasAspectRatio {
      resizeFactor = size.height / image.size.height
    } else {
      resizeFactor = size.width / image.size.width
    }
    
    let scaledSize = CGSize(width: image.size.width * resizeFactor, height: image.size.height * resizeFactor)
    let origin = CGPoint(x: (size.width - scaledSize.width) / 2.0, y: (size.height - scaledSize.height) / 2.0)
    
    UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
    image.draw(in: CGRect(origin: origin, size: scaledSize))
    
    let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return scaledImage!
  }
  
  
  // setup icon of the favorite status button
  fileprivate func setupFavoriteStatus() {
    if recipe.isFavourite {
      likeButton.setImage(UIImage(named: "icFavoritesOrange"), for: UIControl.State())
      likeButton.imageView?.image = UIImage(named: "icFavoritesOrange")
    } else {
      likeButton.setImage(UIImage(named: "icFavorite"), for: UIControl.State())
    }
  }
  
  // setup recipe name
  fileprivate func setupRecipeName(_ recipe: Recipe) {
    let recipeName = recipe.name
    var mutableString = NSMutableAttributedString()
    let font = UIFont(name: "Gill Sans", size: 18.0)!
    mutableString = NSMutableAttributedString(string: recipeName!, attributes: [NSAttributedString.Key.font:font])
    
    self.recipeNameLabel.attributedText = mutableString
  }
  
  // setup ingredients
  fileprivate func setupIngredients(_ recipe: Recipe) {
    let recipeIngredients =
      "Nutrition\nCalories: \(recipe.calories), Carbohydrate: \(recipe.carbos), " +
    "Dietary Fiber: \(recipe.fibers), Fat: \(recipe.fats), Protein: \(recipe.proteins)"
    var mutableString = NSMutableAttributedString()
    let font = UIFont(name: "Gill Sans", size: 14.0)!
    mutableString = NSMutableAttributedString(string: recipeIngredients, attributes: [NSAttributedString.Key.font:font])
    self.recipeIngredientsLabel.attributedText = mutableString
  }
  
  
  // like button tapped this will change the image and store the new status in the db for this recipe
  @IBAction func likeButtonTapped(_ sender: UIButton) {
    if !recipe.isFavourite {
      likeButton.setImage(UIImage(named: "icFavoritesOrange"), for: UIControl.State())
      recipe.isFavourite = !recipe.isFavourite
      recipeDetailsDelegate?.favouriteTapped(recipe: recipe)
    } else {
      likeButton.setImage(UIImage(named: "icFavorite"), for: UIControl.State())
      recipe.isFavourite = !recipe.isFavourite
      recipeDetailsDelegate?.favouriteTapped(recipe: recipe)
    }
  }
  
}

