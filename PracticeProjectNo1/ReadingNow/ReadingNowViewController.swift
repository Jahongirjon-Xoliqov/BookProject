//
//  ReadingNowViewController.swift
//  PracticeProjectNo1
//
//  Created by Dzakhon on 19/08/23.
//

import UIKit

class ReadingNowViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var currentReadingBookView: CurrentReadingBookView!
    @IBOutlet weak var moreToExploreView: MoreToExploreView!
    @IBOutlet weak var allTimeBestsellersView: AllTimeBestsellersView!
    
    private var readingNowModel: ReadingNowModel? {
        didSet {
            self.currentReadingBookView.set(model: readingNowModel?.current)
            self.moreToExploreView.set(model: readingNowModel?.moreToExplore)
            self.allTimeBestsellersView.set(readingNowModel?.allTimeBestsellers)
        }
    }
    
    var navController: MainNavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Reading Now"
        navController = (self.navigationController as! MainNavigationController)
        navController?.addProfileIcon()
        navController?.userIconTappedAction = { [weak self] in
            guard let self else { return }
            self.openProfileEditController()
        }
        requestModel()
    }
    
    private func requestModel() {
        
        if UD.getDataResourceAsDB() {
            self.readingNowModel = CoreDataManager.shared.getSavedReadingNowModel()
        } else {
            APIManager.requestReadingNow { model in
                self.readingNowModel = model
            }
        }
        
    }
    
    private func openProfileEditController() {
        let vc = ProfileViewController(nibName: "ProfileViewController", bundle: nil)
        present(vc, animated: true)
    }
    
}

