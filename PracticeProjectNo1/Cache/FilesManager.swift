//
//  FilesManager.swift
//  PracticeProjectNo1
//
//  Created by Dzakhon on 20/08/23.
//

import UIKit

class FilesManager {
    enum MediaFolder: String {
        case cacheFolder = "cache"
    }
    
    static func isFileExist(underId id: String, at folder: MediaFolder) -> Bool? {
        guard let docUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first,
              let pathURL = URL.init(string: docUrl.path) else { return nil }
        let folderURL = pathURL.appendingPathComponent(folder.rawValue)
        let dataURL = folderURL.appendingPathComponent(id)
        return FileManager.default.fileExists(atPath: dataURL.path)
    }
    
    static func getFileUrl(_ fileId: String, at folder: MediaFolder) -> (Bool?, URL?) {
        guard let docUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return (nil, nil) }
        let folderURL = docUrl.appendingPathComponent(folder.rawValue)
        if !FileManager.default.fileExists(atPath: folderURL.path) {
            //creates new folder if it is not exists
            do {
                try FileManager.default.createDirectory(atPath: folderURL.path, withIntermediateDirectories: true, attributes: nil)
            } catch {
                return (false, nil)
            }
        }
        let dataURL = folderURL.appendingPathComponent(fileId)
        return (FileManager.default.fileExists(atPath: dataURL.path), dataURL)
        
    }
    
    
    static func saveImage(_ data: Data, underID id: String) -> UIImage? {
        let (isExist, url) = getFileUrl(id, at: .cacheFolder)
        guard let isExist else { return nil }
        if isExist {
            return loadImage(underId: id, at: .cacheFolder)
        } else {
            guard let url else { return nil }
            do {
                try data.write(to: url, options: .atomic)
                return loadImage(underId: id, at: .cacheFolder)
            } catch {
                return nil
            }
        }
    }
    
    static func loadImage(underId fileId: String, at folder: MediaFolder) -> UIImage? {
        guard let docUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let fileURL = docUrl.appendingPathComponent(folder.rawValue).appendingPathComponent(fileId)
        do {
            let imageData = try Data(contentsOf: fileURL)
            return UIImage(data: imageData)
        } catch {}
        return nil
    }
    
}
