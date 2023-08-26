//
//  SearchBookModel.swift
//  PracticeProjectNo1
//
//  Created by Dzakhon on 26/08/23.
//

import Foundation

// data loaded from https://yes-pdf.com
struct SearchBookModel: Decodable {
    var books: [BookModel]
}

struct BookModel: Decodable {
    var id: String
    var title: String
    var coverUrl: String
    var publisher: String
    var pages: Int
    var authors: String
    var genre: String
    var fileUrl: String
    var completeProcent: Int
    var isRecentlySearched: Bool
    var isRecentlyViewed: Bool
    var isSavedToLibrary: Bool
    var rate: Double
    var language: String
}
