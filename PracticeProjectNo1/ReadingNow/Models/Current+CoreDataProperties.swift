//
//  Current+CoreDataProperties.swift
//  PracticeProjectNo1
//
//  Created by Dzakhon on 22/08/23.
//
//

import Foundation
import CoreData


extension Current {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Current> {
        return NSFetchRequest<Current>(entityName: "Current")
    }

    @NSManaged public var title: String?
    @NSManaged public var completed: Int16
    @NSManaged public var coverUrl: String?
    @NSManaged public var readingNow: ReadingNow?

}

extension Current : Identifiable {

}
