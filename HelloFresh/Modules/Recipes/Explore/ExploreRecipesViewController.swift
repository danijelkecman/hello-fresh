//
//  ExploreRecipesViewController.swift
//  HelloFresh
//
//  Created by Danijel Kecman on 25/5/19.
//  Copyright (c) 2017 Danijel Kecman. All rights reserved.
//

import UIKit

final class ExploreRecipesViewController: UIViewController {
  
  // MARK: - IBOutlets
  
  @IBOutlet weak var tableView: UITableView!
  private var recipesUpdated = false
  
  // MARK: - Public properties -
  
  var presenter: ExploreRecipesPresenterInterface!
  fileprivate var tasks = [URLSessionTask]()
  
  // MARK: - Lifecycle -
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    _configure()
    
    presenter.viewDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    if recipesUpdated {
      presenter.getStoredRecipes()
      recipesUpdated = false
    }
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    removeBackText(from: self, backButtonColor: .black)
  }
  
  // MARK: - Private methods -
  
  private func _configure() {
    self.title = "Explore Recipes"
    
    _setupRecipesTableUI()
    
    NotificationCenter.default.addObserver(self, selector: #selector(recipeUpdatedOnDetailsScreen),
                                           name: Notification.Name(rawValue: Constants.NotificationConstants.recipeUpdated),
                                           object: nil)
  }
  
  // Setup Recipes Table UI with custom RecipeTableViewCell
  func _setupRecipesTableUI() {
    tableView.register(cellType: RecipeCell.self)
    tableView.prefetchDataSource = self
    
    tableView.tableFooterView = UIView()
  }
  
  @objc
  func recipeUpdatedOnDetailsScreen() {
    recipesUpdated = true
  }
}

// MARK: - Extensions -

// MARK: - Table View Data source -

extension ExploreRecipesViewController: UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return presenter.numberOfSections()
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return presenter.numberOfItems()
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    var item = presenter.item(at: indexPath)
    
    let cell: RecipeCell = tableView.dequeueReusableCell(for: indexPath)
    if let image = presenter.item(at: indexPath).image {
      item.set(image: image)
    } else {
      item.set(image: nil)
      self.downloadImage(forItemAtIndex: indexPath)
    }
    cell.configure(with: item)
    cell.selectionStyle = .none
    cell.favouriteDelegate = self
    
    return cell
  }
  
}

// MARK: - Table View Delegate

extension ExploreRecipesViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    presenter.didSelectItemAt(indexPath: indexPath)
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 240
  }
  
}

// MARK: - TableView Prefetching

extension ExploreRecipesViewController: UITableViewDataSourcePrefetching {
  func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
    log.info("prefetchedRowsAt: \(indexPaths)")
    indexPaths.forEach { self.downloadImage(forItemAtIndex: $0) }
  }
  
  func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
    log.info("cancelPrefetchedRowsAt: \(indexPaths)")
    indexPaths.forEach { self.cancelDownloadingImage(forItemAtIndex: $0) }
  }
}


// MARK: - Presenter -> View

extension ExploreRecipesViewController: ExploreRecipesViewInterface {
  func reloadTable() {
    tableView.reloadData()
  }
}

// MARK: - TabBar Extension

extension ExploreRecipesViewController: TabBarItemConfigurable {
  
  func tabBarItemTitle() -> String {
    return "Explore Recipes"
  }
  
  func tabBarItemImageName(active: Bool) -> String {
    return active ? "icHomeOrange" : "icHomeGrey"
  }
  
  func configureTabBarItem() {
    let fontAttributes = [NSAttributedString.Key.font: UIFont.tabLabelFont()]
    
    tabBarItem.title = tabBarItemTitle()
    tabBarItem.image = UIImage(named: tabBarItemImageName(active: false))
    tabBarItem.selectedImage = UIImage(named: tabBarItemImageName(active: true))
    tabBarItem.setTitleTextAttributes(fontAttributes, for: .normal)
  }
}

// MARK: - RecipeCell Favourite Protocol -

extension ExploreRecipesViewController: RecipeCellFavouriteProtocol {
  func didChangeRatingFor(recipeId: String, with rating: Float) {
    presenter.didChangeRatingFor(recipeId: recipeId, with: rating)
  }
  
  func didSelectFavouriteWith(recipeId: String, isFavourite: Bool) {
    presenter.didSelectFavouriteWith(recipeId: recipeId, isFavourite: isFavourite)
  }
}

// MARK: - Network Utilities

extension ExploreRecipesViewController {
  
  fileprivate func downloadImage(forItemAtIndex indexPath: IndexPath) {
    let imageUrl = presenter.item(at: indexPath).imageUrl
    let url = URL(string: imageUrl)!
    guard tasks.firstIndex(where: { $0.originalRequest?.url == url }) == nil else { return }
    let task = URLSession.shared.dataTask(with: url) { data, resposne, error in
      DispatchQueue.main.async {
        if let data = data, let image = UIImage(data: data) {
          self.presenter.setItemImage(image, at: indexPath.row)
          let indexPath = IndexPath(row: indexPath.row, section: 0)
          if self.tableView.indexPathsForVisibleRows?.contains(indexPath) ?? false {
            self.tableView.reloadRows(at: [indexPath], with: .fade)
          }
        }
      }
    }
    task.resume()
    tasks.append(task)
  }
  
  fileprivate func cancelDownloadingImage(forItemAtIndex indexPath: IndexPath) {
    let url = URL(string: presenter.item(at: indexPath).imageUrl)
    guard let taskIndex = tasks.firstIndex(where: { $0.originalRequest?.url == url }) else { return }
    let task = tasks[taskIndex]
    task.cancel()
    tasks.remove(at: taskIndex)
  }
}






















