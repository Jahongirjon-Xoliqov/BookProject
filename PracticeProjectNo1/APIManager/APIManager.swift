//
//  APIManager.swift
//  PracticeProjectNo1
//
//  Created by Dzakhon on 20/08/23.
//

import Foundation

class APIManager {
    
    static func requestReadingNow(completion: @escaping(ReadingNowModel)->Void) {
        
        guard let path = Bundle.main.path(forResource: "MockData", ofType: "json") else { return }
        let url = URL(fileURLWithPath: path)

        DispatchQueue.global(qos: .background).async {
            do {
                let data = try Data(contentsOf: url)
                let model = try JSONDecoder().decode(ReadingNowModel.self, from: data)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    completion(model)
                }
            } catch {
                
            }
        }
        
        
    }
    
}
