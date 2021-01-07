//
//  CachingData.swift
//  IOSBasic
//
//  Created by Duong Yen-Ly on 20/12/2020.
//

import UIKit
import os

protocol CachingData {
    func saveObject(fileName: String, object: Any) -> Bool
    func getObject(fileName: String) -> Any?
    func getDirectoryPath() -> URL
    func removeObject(path: String) -> Bool
}

extension CachingData {
    func removeObject(path: String) -> Bool{
        let exists = FileManager.default.fileExists(atPath: path)
        if exists {
            do {
                try FileManager.default.removeItem(atPath: path)
            } catch {
                return false
            }
        }
        return exists
    }

    func saveObject(fileName: String, object: Any) -> Bool {
        let filePath = getDirectoryPath().appendingPathComponent(fileName)
        os_log("Object saved at : \(filePath)")
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: object, requiringSecureCoding: false)
            try data.write(to: filePath)
            return true
        } catch let error as NSError {
            os_log("Error \(error)")
            return false
        }
    }

    func getObject(fileName: String) -> Any? {
        let filePath = getDirectoryPath().appendingPathComponent(fileName)
        do {
            let data = try Data(contentsOf: filePath)
            let object = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data)
            return object
        } catch {
            return nil
        }
    }
    
    func getDirectoryPath() -> URL {
        let arrayPaths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return arrayPaths[0]
    }
}
