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

        do {
            let json = try Data(contentsOf: url)
            let jsonObject = try JSONSerialization.jsonObject(with: json, options: []) as! [String: Any]
            CoreDataManager.shared.saveReadingNow(from: jsonObject)
            completion(CoreDataManager.shared.getSavedReadingNowModel())
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    static func requestBooks(completion: @escaping([BookModel])->Void) {
        
        guard let path = Bundle.main.path(forResource: "SearchBooksAPIMock", ofType: "json") else { return }
        let url = URL(fileURLWithPath: path)

        do {
            let json = try Data(contentsOf: url)
            let books = try JSONDecoder().decode([BookModel].self, from: json)
            completion(books)
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
}
