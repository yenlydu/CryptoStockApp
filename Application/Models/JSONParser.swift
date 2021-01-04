//
//  JSONParser.swift
//  IOSBasic
//
//  Created by Duong Yen-Ly on 28/11/2020.
//

import Foundation

public class JSONParser {
    func getInvestment() -> [Cryptocurrency]! {
        if let localData = readLocalFile(forName: "prices") {
            return(parse(jsonData: localData))
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
            return nil
        }
        return nil
    }

    private func parse(jsonData: Data) -> [Cryptocurrency]! {
        do {
            let decodedData = try JSONDecoder().decode(Investments.self,
                                                       from: jsonData)
            return (decodedData.investments)
        } catch {
            return nil
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

