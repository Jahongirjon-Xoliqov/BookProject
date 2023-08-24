//
//  AllTimeBestsellers+CoreDataProperties.swift
//  PracticeProjectNo1
//
//  Created by Dzakhon on 22/08/23.
//
//

import Foundation
import CoreData


extension AllTimeBestsellers {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AllTimeBestsellers> {
        return NSFetchRequest<AllTimeBestsellers>(entityName: "AllTimeBestsellers")
    }

    @NSManaged public var coverImageUrl: String?
    @NSManaged public var readingNow: ReadingNow?

}

extension AllTimeBestsellers : Identifiable {

}
