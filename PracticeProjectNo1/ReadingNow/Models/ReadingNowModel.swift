//
//  ReadingNowModel.swift
//  PracticeProjectNo1
//
//  Created by Dzakhon on 20/08/23.
//

import Foundation

struct ReadingNowModel: Decodable {
    var current: CurrentModel
    var moreToExplore: [MoreToExploreModel]
    var allTimeBestsellers: [AllTimeBestsellersModel]
    var readingGoals: ReadingGoalsModel
}
        
struct CurrentModel: Decodable {
    var title: String
    var completed: Int
    var coverUrl: String
    init(current: Current?) {
        self.title = current?.title ?? ""
        self.completed = Int(current?.completed ?? 0)
        self.coverUrl = current?.coverUrl ?? ""
    }
}

struct MoreToExploreModel: Decodable {
    var title: String
    var firstBookCoverUrl: String
    var secondBookCoverUrl: String
    var thirdBookCoverUrl: String
    init(moreToExploreModel: MoreToExplore?) {
        self.title = moreToExploreModel?.title ?? ""
        self.firstBookCoverUrl = moreToExploreModel?.firstBookCoverUrl ?? ""
        self.secondBookCoverUrl = moreToExploreModel?.secondBookCoverUrl ?? ""
        self.thirdBookCoverUrl = moreToExploreModel?.thirdBookCoverUrl ?? ""
    }
}

struct AllTimeBestsellersModel: Decodable {
    var coverImageUrl: String
    init(allTimeBestsellersModel: AllTimeBestsellers?) {
        self.coverImageUrl = allTimeBestsellersModel?.coverImageUrl ?? ""
    }
}

struct ReadingGoalsModel: Decodable {
    var lastReadingBookTitle: String
    var timeCompleted: Double
    var procentCompleted: Int
    init(readingGoalsModel: ReadingGoals?) {
        self.lastReadingBookTitle = readingGoalsModel?.lastReadingBookTitle ?? ""
        self.timeCompleted = readingGoalsModel?.timeCompleted ?? 0
        self.procentCompleted = Int(readingGoalsModel?.procentCompleted ?? 0)
    }
}
