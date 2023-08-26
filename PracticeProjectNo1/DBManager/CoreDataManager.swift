//
//  CoreDataManager.swift
//  PracticeProjectNo1
//
//  Created by Dzakhon on 22/08/23.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    private init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "PracticeProjectNo1")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    lazy var context: NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()
    
    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func getSavedReadingNowModel() -> ReadingNowModel {
        
        let context = CoreDataManager.shared.context
        let fetchRequest: NSFetchRequest<ReadingNow> = ReadingNow.fetchRequest()
        let readingNowArray = try? context.fetch(fetchRequest)
        let readingNowEntity = readingNowArray?.first
        
        
        let current = CurrentModel(current: readingNowEntity?.current)
        let goal = ReadingGoalsModel(readingGoalsModel: readingNowEntity?.readingGoals)
        
        let allTimeBestsellersFetchRequest: NSFetchRequest<AllTimeBestsellers> = AllTimeBestsellers.fetchRequest()
        let allTimeBestsellersArray = try? context.fetch(allTimeBestsellersFetchRequest)
        let allTimeBestsellersArray2 = allTimeBestsellersArray!.filter { $0.readingNow == readingNowEntity }
        
        let moreToExploreFetchRequest: NSFetchRequest<MoreToExplore> = MoreToExplore.fetchRequest()
        let moreToExploreArray = try? context.fetch(moreToExploreFetchRequest)
        let moreToExploreArray2 = moreToExploreArray!.filter { $0.readingNow == readingNowEntity }
        
        let readingNowModel = ReadingNowModel(current: current,
                                              moreToExplore: moreToExploreArray2.map { MoreToExploreModel(moreToExploreModel: $0)},
                                              allTimeBestsellers: allTimeBestsellersArray2.map { AllTimeBestsellersModel(allTimeBestsellersModel: $0)},
                                              readingGoals: goal)
        
        return readingNowModel
        
    }
    
    static func resetAllRecords(in entity : String) {
        
        let context = CoreDataManager.shared.context
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
        do {
            try context.execute(deleteRequest)
            try context.save()
        } catch {
            print ("There was an error")
        }
        
    }
    
    func saveReadingNow(from json: [String: Any]) {
        
        CoreDataManager.resetAllRecords(in: "Current")
        CoreDataManager.resetAllRecords(in: "MoreToExplore")
        CoreDataManager.resetAllRecords(in: "AllTimeBestsellers")
        CoreDataManager.resetAllRecords(in: "ReadingNow")
        CoreDataManager.resetAllRecords(in: "ReadingGoals")
        
        do {
            
            let readingNow = ReadingNow(context: context)
            
            // Save current book
            if let currentData = json["current"] as? [String: Any] {
                let currentBook = Current(context: context)
                currentBook.title = currentData["title"] as? String
                currentBook.completed = currentData["completed"] as? Int16 ?? 0
                currentBook.coverUrl = currentData["coverUrl"] as? String
                
                readingNow.current = currentBook
                
            }
            
            // Save explore categories
            if let exploreData = json["moreToExplore"] as? [[String: Any]] {
                var exploreSet = NSSet()
                for categoryData in exploreData {
                    let exploreCategory = MoreToExplore(context: context)
                    exploreCategory.title = categoryData["title"] as? String
                    exploreCategory.firstBookCoverUrl = categoryData["firstBookCoverUrl"] as? String
                    exploreCategory.secondBookCoverUrl = categoryData["secondBookCoverUrl"] as? String
                    exploreCategory.thirdBookCoverUrl = categoryData["thirdBookCoverUrl"] as? String
                    exploreSet = exploreSet.adding(exploreCategory) as NSSet
                }
                readingNow.moreToExplore = exploreSet
            }
            
            // Save all-time bestsellers
            if let bestsellersData = json["allTimeBestsellers"] as? [[String: Any]] {
                var bestsellersSet = NSSet()
                for bestsellerData in bestsellersData {
                    let bestsellerBook = AllTimeBestsellers(context: context)
                    bestsellerBook.coverImageUrl = bestsellerData["coverImageUrl"] as? String
                    bestsellersSet = bestsellersSet.adding(bestsellerBook) as NSSet
                }
                readingNow.allTimeBestsellers = bestsellersSet
            }
            
            // Save current reading goal
            if let readingGoalData = json["readingGoals"] as? [String: Any] {
                let readingGoal = ReadingGoals(context: context)
                readingGoal.lastReadingBookTitle = readingGoalData["lastReadingBookTitle"] as? String
                readingGoal.timeCompleted = readingGoalData["timeCompleted"] as? Double ?? 0
                readingGoal.procentCompleted = readingGoalData["procentCompleted"] as? Int16 ?? 0
                
                readingNow.readingGoals = readingGoal
                
            }
            
            // Save the context
            try context.save()
            
        } catch {
            print(error.localizedDescription)
        }
            
            
        
    }
    
}
