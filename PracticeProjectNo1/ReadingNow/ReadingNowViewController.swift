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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Reading Now"
        (navigationController as! MainNavigationController).addProfileIcon()
    }

}
