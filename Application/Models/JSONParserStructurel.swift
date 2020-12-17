//
//  JSON.swift
//  IOSBasic
//
//  Created by Duong Yen-Ly on 17/12/2020.
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
    let icon: String
    let prices: [Prices]
    let variationsPercentage: [Variations]
    let variationsLastWeek: [VariationsLastWeek]
}

struct Investments: Codable {
    var investments: [Cryptocurrency]
}
