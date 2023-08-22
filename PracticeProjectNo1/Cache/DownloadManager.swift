//
//  DownloadManager.swift
//  PracticeProjectNo1
//
//  Created by Dzakhon on 20/08/23.
//

import UIKit

protocol DownloadManagerDelegate: AnyObject {
    func downloadManager(didUpdateDownloadPercentage percent: Int, for downloadTask: DownloadTask)
    func downlaodManager(didEndDownloadingFor task: DownloadTask, downloaded image: UIImage)
}

class DownloadManager: NSObject {
    
    private var currentTasks: [DownloadTask] = []
    weak var delegate: DownloadManagerDelegate?
    
    private let byteFormatter: ByteCountFormatter = {
        let formatter = ByteCountFormatter()
        formatter.allowedUnits = [.useKB, .useMB]
        return formatter
    }()
    
    var taskCount: Int {
        currentTasks.count
    }
    
    override init() {
        super.init()
    }
    
    func addTaskIfNotExist(urlString: String, id: String) {
        //checks weather task with the same id (name in this case)
        //if exists will not create new one or otherwise
        guard !currentTasks.map({ $0.id }).contains(id) else { return }
        //creates new task
        guard let url = URL(string: urlString) else { return }
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config, delegate: self, delegateQueue: .current)
        let newTask = DownloadTask(id: id, session: session)
        self.currentTasks.append(newTask)
        DispatchQueue.main.async {
            // Don't specify a completion handler here or the delegate won't be called
            session.downloadTask(with: url).resume()
        }
    }
    
}

extension DownloadManager: URLSessionDownloadDelegate {
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let written = Double(totalBytesWritten)
        let expected = Double(totalBytesExpectedToWrite)
        let percent = Int((written/expected)*100)
        guard let task = currentTasks.filter({ $0.session == session }).first else { return }
        delegate?.downloadManager(didUpdateDownloadPercentage: percent, for: task)
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        guard let task = currentTasks.filter({ $0.session == session }).first else { return }
        guard let data = try? Data(contentsOf: location) else { return }
        guard let img = FilesManager.saveImage(data, underID: task.id) else { return }
        delegate?.downlaodManager(didEndDownloadingFor: task, downloaded: img)
        currentTasks = currentTasks.filter({ $0.id != task.id })
    }
    
}

