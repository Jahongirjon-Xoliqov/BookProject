//
//  ReadingNow+CoreDataProperties.swift
//  PracticeProjectNo1
//
//  Created by Dzakhon on 22/08/23.
//
//

import Foundation
import CoreData


extension ReadingNow {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ReadingNow> {
        return NSFetchRequest<ReadingNow>(entityName: "ReadingNow")
    }

    @NSManaged public var current: Current?
    @NSManaged public var allTimeBestsellers: NSSet?
    @NSManaged public var readingGoals: ReadingGoals?
    @NSManaged public var moreToExplore: NSSet?

}

// MARK: Generated accessors for allTimeBestsellers
extension ReadingNow {

    @objc(addAllTimeBestsellersObject:)
    @NSManaged public func addToAllTimeBestsellers(_ value: AllTimeBestsellers)

    @objc(removeAllTimeBestsellersObject:)
    @NSManaged public func removeFromAllTimeBestsellers(_ value: AllTimeBestsellers)

    @objc(addAllTimeBestsellers:)
    @NSManaged public func addToAllTimeBestsellers(_ values: NSSet)

    @objc(removeAllTimeBestsellers:)
    @NSManaged public func removeFromAllTimeBestsellers(_ values: NSSet)

}

// MARK: Generated accessors for moreToExplore
extension ReadingNow {

    @objc(addMoreToExploreObject:)
    @NSManaged public func addToMoreToExplore(_ value: MoreToExplore)

    @objc(removeMoreToExploreObject:)
    @NSManaged public func removeFromMoreToExplore(_ value: MoreToExplore)

    @objc(addMoreToExplore:)
    @NSManaged public func addToMoreToExplore(_ values: NSSet)

    @objc(removeMoreToExplore:)
    @NSManaged public func removeFromMoreToExplore(_ values: NSSet)

}

extension ReadingNow : Identifiable {

}
