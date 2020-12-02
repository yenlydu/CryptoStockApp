//
//  JSONParser.swift
//  IOSBasic
//
//  Created by Duong Yen-Ly on 28/11/2020.
//

import Foundation

struct Variations: Codable {
    let oneDay: Double
    let oneWeek: Double
}

struct Cryptocurrency: Codable {
    let name: String
    let symbol: String
//    let oneDay: Double
//    let oneWeek: Double
    let variationsPercentage: [Variations]
}

struct Investments: Codable {
    var investments: [Cryptocurrency]
}

public class JSONParser {
    func getInvestment() {
        if let localData = self.readLocalFile(forName: "prices") {
            self.parse(jsonData: localData)
        }
    }
    private func readLocalFile(forName fileName: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: fileName,
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        
        return nil
    }
    private func parse(jsonData: Data) {
        do {
            let decodedData = try JSONDecoder().decode(Investments.self,
                                                       from: jsonData)
//            print(decodedData.investments[0].)

            let encodedData = try NSKeyedArchiver.archivedData(withRootObject: decodedData.investments, requiringSecureCoding: false)

            let userDefaults = UserDefaults.standard
            userDefaults.set(encodedData, forKey: "data")

            print("===================================")
        } catch {
            print("decode error")
        }
    }
    private func loadJson(fromURLString urlString: String,
                          completion: @escaping (Result<Data, Error>) -> Void) {
        if let url = URL(string: urlString) {
            let urlSession = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
                if let error = error {
                    completion(.failure(error))
                }
                
                if let data = data {
                    completion(.success(data))
                }
            }
            
            urlSession.resume()
        }
    }

}

