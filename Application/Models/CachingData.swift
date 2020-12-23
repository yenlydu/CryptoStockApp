//
//  CachingData.swift
//  IOSBasic
//
//  Created by Duong Yen-Ly on 20/12/2020.
//

import UIKit

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
            }catch let error as NSError {
                print("error: \(error.localizedDescription)")
                return false
            }
        }
        return exists
    }
    func saveObject(fileName: String, object: Any) -> Bool {
        let filePath = self.getDirectoryPath().appendingPathComponent(fileName)//1
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: object, requiringSecureCoding: false)//2
            try data.write(to: filePath)//3
            return true
        } catch {
            print("error is: \(error.localizedDescription)")//4
        }
        return false
    }

    func getObject(fileName: String) -> Any? {
        let filePath = self.getDirectoryPath().appendingPathComponent(fileName)//5
        print(filePath)

        do {
            let data = try Data(contentsOf: filePath)//6
            let object = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data)//7
            return object
        } catch {
            print("error is: \(error.localizedDescription)")//9
        }
        return nil
    }
    
    func getDirectoryPath() -> URL {
        let arrayPaths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return arrayPaths[0]
    }
}
