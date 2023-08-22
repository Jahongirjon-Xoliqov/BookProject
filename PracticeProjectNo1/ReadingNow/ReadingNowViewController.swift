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
    
    private var readingNowModel: ReadingNowModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Reading Now"
        (navigationController as! MainNavigationController).addProfileIcon()
        requestModel()
    }
    
    private func requestModel() {
        APIManager.requestReadingNow { model in
            self.readingNowModel = model
            self.currentReadingBookView.set(model: model.current)
            self.moreToExploreView.set(model: model.moreToExplore)
        }
    }
    
}

