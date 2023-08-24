//
//  MoreToExplore+CoreDataProperties.swift
//  PracticeProjectNo1
//
//  Created by Dzakhon on 22/08/23.
//
//

import Foundation
import CoreData


extension MoreToExplore {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MoreToExplore> {
        return NSFetchRequest<MoreToExplore>(entityName: "MoreToExplore")
    }

    @NSManaged public var title: String?
    @NSManaged public var firstBookCoverUrl: String?
    @NSManaged public var secondBookCoverUrl: String?
    @NSManaged public var thirdBookCoverUrl: String?
    @NSManaged public var readingNow: ReadingNow?

}

extension MoreToExplore : Identifiable {

}
