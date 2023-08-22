//
//  UIImageView+Extensions.swift
//  PracticeProjectNo1
//
//  Created by Dzakhon on 21/08/23.
//

import UIKit

extension UIImageView {
    
    func downloadImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        URLSession.shared.downloadTask(with: request) { localUrl, _, _ in
            guard let localUrl else { return }
            do {
                let data = try Data(contentsOf: localUrl)
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    self.image = image
                }
            } catch {
                fatalError()
            }
        }.resume()
    }
    
}
