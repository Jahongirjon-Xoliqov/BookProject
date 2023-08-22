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
}

struct MoreToExploreModel: Decodable {
    var title: String
    var firstBookCoverUrl: String
    var secondBookCoverUrl: String
    var thirdBookCoverUrl: String
}

struct AllTimeBestsellersModel: Decodable {
    var coverImageUrl: String
}

struct ReadingGoalsModel: Decodable {
    var lastReadingBookTitle: String
    var timeCompleted: Double
    var procentCompleted: Int
}
