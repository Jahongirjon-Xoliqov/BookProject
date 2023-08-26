//
//  UserDefaults+Extensions.swift
//  PracticeProjectNo1
//
//  Created by Dzakhon on 24/08/23.
//

import Foundation


class UD {
    
    static var shared = UserDefaults.standard
    
    enum Key: String {
        case dataResource = "DataResource"
    }
    
    static func save(dataResourceAsDB isDB: Bool) {
        shared.set(isDB, forKey: Key.dataResource.rawValue)
    }
    
    static func getDataResourceAsDB() -> Bool {
        shared.bool(forKey: Key.dataResource.rawValue)
    }
    
}
