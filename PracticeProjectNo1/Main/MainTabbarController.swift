//
//  MainTabbarController.swift
//  PracticeProjectNo1
//
//  Created by Dzakhon on 19/08/23.
//

import UIKit

class MainTabbarController: UITabBarController {
    
    var readingNowViewController: ReadingNowViewController?
    var libraryViewController: LibraryViewController?
    var bookStoreViewController: BookStoreViewController?
    var searchViewController: SearchViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabBarItemAppearance = UITabBarItemAppearance(style: .stacked)
        tabBarItemAppearance.selected.iconColor = UIColor.black
        tabBarItemAppearance.selected.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 11),
            NSAttributedString.Key.foregroundColor: UIColor.black
        ]
        tabBarItemAppearance.normal.iconColor = UIColor.systemGray
        tabBarItemAppearance.normal.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 11),
            NSAttributedString.Key.foregroundColor: UIColor.systemGray
        ]
        
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.stackedLayoutAppearance = tabBarItemAppearance
        tabBarAppearance.configureWithDefaultBackground()
        
        tabBar.standardAppearance = tabBarAppearance
        

        let readingBarItem = UITabBarItem(title: "Reading Now", image: UIImage(systemName: "book.fill"), tag: 0)
        let libraryBarItem = UITabBarItem(title: "Library", image: UIImage(systemName: "books.vertical.fill"), tag: 1)
        let bookStoreBarItem = UITabBarItem(title: "Book Store", image: UIImage(systemName: "bag.fill"), tag: 2)
        let searchBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 3)
        
        
        readingNowViewController = ReadingNowViewController(nibName: "ReadingNowViewController", bundle: nil)
        libraryViewController = LibraryViewController(nibName: "LibraryViewController", bundle: nil)
        bookStoreViewController = BookStoreViewController(nibName: "BookStoreViewController", bundle: nil)
        searchViewController = SearchViewController(nibName: "SearchViewController", bundle: nil)
        
        readingNowViewController?.tabBarItem = readingBarItem
        libraryViewController?.tabBarItem = libraryBarItem
        bookStoreViewController?.tabBarItem = bookStoreBarItem
        searchViewController?.tabBarItem = searchBarItem
        
        
        setViewControllers([
            MainNavigationController.attach(readingNowViewController),
            MainNavigationController.attach(libraryViewController),
            MainNavigationController.attach(bookStoreViewController),
            MainNavigationController.attach(searchViewController)
        ], animated: false)
        
    }
    
}
