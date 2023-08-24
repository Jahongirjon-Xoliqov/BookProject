//
//  ReadingGoals+CoreDataProperties.swift
//  PracticeProjectNo1
//
//  Created by Dzakhon on 22/08/23.
//
//

import Foundation
import CoreData


extension ReadingGoals {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ReadingGoals> {
        return NSFetchRequest<ReadingGoals>(entityName: "ReadingGoals")
    }

    @NSManaged public var lastReadingBookTitle: String?
    @NSManaged public var timeCompleted: Double
    @NSManaged public var procentCompleted: Int16
    @NSManaged public var readingNow: ReadingNow?

}

extension ReadingGoals : Identifiable {

}
