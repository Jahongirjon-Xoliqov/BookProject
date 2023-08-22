//
//  DownloadTask.swift
//  PracticeProjectNo1
//
//  Created by Dzakhon on 20/08/23.
//

import UIKit

enum MediaType {
    case image
    case none
}

struct DownloadTask {
    var id: String
    var session: URLSession
    var url: URL?
}
