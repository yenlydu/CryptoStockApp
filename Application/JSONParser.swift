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

struct VariationsLastWeek: Codable {
    let monday: Double
    let tuesday: Double
    let wednesday: Double
    let thursday: Double
    let friday: Double
    let saturday: Double
    let sunday: Double
}

struct Prices: Codable {
    let euro: Double
    let usd: Double
}

struct Cryptocurrency: Codable {
    let name: String
    let symbol: String
    let prices: [Prices]
    let variationsPercentage: [Variations]
    let variationsLastWeek: [VariationsLastWeek]
}

struct Investments: Codable {
    var investments: [Cryptocurrency]
}

public class JSONParser {
    func getInvestment() -> [Cryptocurrency]! {
        if let localData = self.readLocalFile(forName: "prices") {
            return(self.parse(jsonData: localData))
        }
        return nil
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
    private func parse(jsonData: Data) -> [Cryptocurrency]! {
        do {
            let decodedData = try JSONDecoder().decode(Investments.self,
                                                       from: jsonData)
            print(decodedData.investments)
            return (decodedData.investments)
        } catch let jsonError as NSError {
            print("JSON decode failed: \(jsonError.localizedDescription)")

            print("decode error")
        }
        return nil
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

