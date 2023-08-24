//
//  APIManager.swift
//  PracticeProjectNo1
//
//  Created by Dzakhon on 20/08/23.
//

import Foundation
import CoreData
import UIKit

class APIManager {
    
    static func requestReadingNow(completion: @escaping(ReadingNowModel)->Void) {
        
        guard let path = Bundle.main.path(forResource: "MockData", ofType: "json") else { return }
        let url = URL(fileURLWithPath: path)

//        DispatchQueue.global(qos: .background).async {
//            do {
//                let data = try Data(contentsOf: url)
//                let model = try JSONDecoder().decode(ReadingNowModel.self, from: data)
//                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//                    completion(model)
//                }
//            } catch {
//
//            }
//        }
        
        let context = CoreDataManager.shared.context
        let fetchRequest: NSFetchRequest<ReadingNow> = ReadingNow.fetchRequest()
        let readingNowArray = try? context.fetch(fetchRequest)
//        readingNowArray?.forEach {
//            context.delete($0)
//        }
//
//        try? context.save()
        let readingNowEntity = readingNowArray?.first
        
        
        let current = CurrentModel(current: readingNowEntity?.current)
        let goal = ReadingGoalsModel(readingGoalsModel: readingNowEntity?.readingGoals)
        
        for i in readingNowEntity!.allTimeBestsellers!.allObjects {
            print(i)
        }
        
        var readingNowModel = ReadingNowModel(current: current,
                                                   moreToExplore: [],
                                                   allTimeBestsellers: [],
                                                   readingGoals: goal)
        
        
        
        print(readingNowEntity?.allTimeBestsellers)
        completion(readingNowModel)
        
        /*
        do {
            
            let json = try Data(contentsOf: url)
            let jsonObject = try JSONSerialization.jsonObject(with: json, options: []) as! [String: Any]
            
            let readingNow = ReadingNow(context: context)
            
            // Save current book
            if let currentData = jsonObject["current"] as? [String: Any] {
                let currentBook = Current(context: context)
                currentBook.title = currentData["title"] as? String
                currentBook.completed = currentData["completed"] as? Int16 ?? 0
                currentBook.coverUrl = currentData["coverUrl"] as? String
                
                readingNow.current = currentBook
                
            }
            
            // Save explore categories
            if let exploreData = jsonObject["moreToExplore"] as? [[String: Any]] {
                for categoryData in exploreData {
                    let exploreCategory = MoreToExplore(context: context)
                    exploreCategory.title = categoryData["title"] as? String
                    exploreCategory.firstBookCoverUrl = categoryData["firstBookCoverUrl"] as? String
                    exploreCategory.secondBookCoverUrl = categoryData["secondBookCoverUrl"] as? String
                    exploreCategory.thirdBookCoverUrl = categoryData["thirdBookCoverUrl"] as? String
                    
                    readingNow.moreToExplore?.adding(exploreCategory)
                    
                }
                
            }
            
            // Save all-time bestsellers
            if let bestsellersData = jsonObject["allTimeBestsellers"] as? [[String: Any]] {
                for bestsellerData in bestsellersData {
                    let bestsellerBook = AllTimeBestsellers(context: context)
                    bestsellerBook.coverImageUrl = bestsellerData["coverImageUrl"] as? String
                    
                    readingNow.allTimeBestsellers?.adding(bestsellerBook)
                    
                }
            }
            
            // Save current reading goal
            if let readingGoalData = jsonObject["readingGoals"] as? [String: Any] {
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
         
         */
        
    }
    
}
