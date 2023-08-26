//
//  SearchViewController.swift
//  PracticeProjectNo1
//
//  Created by Dzakhon on 19/08/23.
//

import UIKit
import Combine

class SearchViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    private let searchController = UISearchController(searchResultsController: nil)
    
    private var books: [BookModel] = []
    
    private var suggestedBooks: [BookModel] = []
    private var recentlySearchedBooks: [BookModel] = []
    private var recentlyViewsBooks: [BookModel] = []
    private var savedToLibraryBooks: [BookModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        
        configureSearchController()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(SuggestionsCollectionViewCell.nib(), forCellWithReuseIdentifier: SuggestionsCollectionViewCell.id)
        collectionView.register(YourLibraryCollectionViewCell.nib(), forCellWithReuseIdentifier: YourLibraryCollectionViewCell.id)
        collectionView.register(RecentCollectionViewCell.nib(), forCellWithReuseIdentifier: RecentCollectionViewCell.id)
        collectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.id)
        
        APIManager.requestBooks { books in
            self.books = books
            self.suggestedBooks = self.getSuggestedBooks()
            self.recentlySearchedBooks = self.getRecentlySearchedBooks()
            self.recentlyViewsBooks = self.getRecentlyViewsBooks()
            self.savedToLibraryBooks = self.getSavedToLibraryBooks()
            self.collectionView.reloadData()
        }
        
    }
    
    
    func getSuggestedBooks(for text: String = "") -> [BookModel] {
        books.filter { $0.title.hasPrefix(text) }
    }
    
    func getRecentlySearchedBooks(for text: String = "") -> [BookModel] {
        books.filter { $0.isRecentlySearched }.filter { $0.title.hasPrefix(text) }
    }
    
    func getRecentlyViewsBooks(for text: String = "") -> [BookModel] {
        books.filter { $0.isRecentlyViewed }.filter { $0.title.hasPrefix(text) }
    }
    
    func getSavedToLibraryBooks(for text: String = "") -> [BookModel] {
        books.filter { $0.isSavedToLibrary }.filter { $0.title.hasPrefix(text) }
    }

}


extension SearchViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    func configureSearchController() {
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Books & Audiobooks"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
        
    }
    
}

extension SearchViewController: UICollectionViewDelegate {
    
}

extension SearchViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch indexPath.section {
        case 0:
            return suggestedBooks.isEmpty ? .zero : CGSize(width: collectionView.frame.width, height: 60)
        case 1:
            return recentlySearchedBooks.isEmpty ? .zero : CGSize(width: collectionView.frame.width, height: 60)
        case 2:
            return recentlyViewsBooks.isEmpty ? .zero : CGSize(width: collectionView.frame.width, height: 60)
        case 3:
            return savedToLibraryBooks.isEmpty ? .zero : CGSize(width: collectionView.frame.width, height: 60)
        default:
            return .zero
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        switch section {
        case 0:
            return suggestedBooks.isEmpty ? .zero : CGSize(width: collectionView.frame.width, height: 40)
        case 1:
            return recentlySearchedBooks.isEmpty ? .zero : CGSize(width: collectionView.frame.width, height: 40)
        case 2:
            return recentlyViewsBooks.isEmpty ? .zero : CGSize(width: collectionView.frame.width, height: 40)
        case 3:
            return savedToLibraryBooks.isEmpty ? .zero : CGSize(width: collectionView.frame.width, height: 40)
        default:
            return .zero
        }
    }
}

extension SearchViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return suggestedBooks.count
        case 1:
            return recentlySearchedBooks.count
        case 2:
            return recentlyViewsBooks.count
        case 3:
            return savedToLibraryBooks.count
        default:
            return .zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SuggestionsCollectionViewCell.id, for: indexPath) as? SuggestionsCollectionViewCell
            cell?.titleLabel.text = suggestedBooks[indexPath.row].title
            return cell ?? UICollectionViewCell()
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecentCollectionViewCell.id, for: indexPath) as? RecentCollectionViewCell
            cell?.titleLabel.text = recentlySearchedBooks[indexPath.row].title
            return cell ?? UICollectionViewCell()
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecentCollectionViewCell.id, for: indexPath) as? RecentCollectionViewCell
            cell?.titleLabel.text = recentlyViewsBooks[indexPath.row].title
            return cell ?? UICollectionViewCell()
        case 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: YourLibraryCollectionViewCell.id, for: indexPath) as? YourLibraryCollectionViewCell
            cell?.titleLabel.text = savedToLibraryBooks[indexPath.row].title
            return cell ?? UICollectionViewCell()
        default:
            return UICollectionViewCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollectionReusableView.id, for: indexPath) as? HeaderCollectionReusableView
        
        switch indexPath.section {
        case 0: headerView?.setTitle("Suggestions")
        case 1: headerView?.setTitle("Recently Searched")
        case 2: headerView?.setTitle("Recently Viewed")
        case 3: headerView?.setTitle("Saved to Library")
        default:
            break
        }
        
        return headerView ?? HeaderCollectionReusableView()
    }
    
}
