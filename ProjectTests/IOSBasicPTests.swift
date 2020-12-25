//
//  IOSBasicProjectTests.swift
//  IOSBasicProjectTests
//
//  Created by Duong Yen-Ly on 27/11/2020.
//

import XCTest
@testable import IOSBasic

extension XCTestCase {
  enum TestError: Error {
    case fileNotFound
  }
  
  func getData(fromJSON fileName: String) throws -> Data {
    
    guard let url = Bundle.main.url(forResource: "prices", withExtension: "json") else {
      XCTFail("Missing File: \(fileName).json")
      throw TestError.fileNotFound
    }
    do {
      let data = try Data(contentsOf: url)
      return data
    } catch {
      throw error
    }
  }
}

class IOSBasicTests: XCTestCase {
    var investments : Investments? = nil
    override func setUpWithError() throws {
        super.setUp()
        let data = try getData(fromJSON: "prices")
        investments = try JSONDecoder().decode(Investments.self, from: data)
        testJSONCount()
    }

    override func tearDownWithError() throws {
        investments = nil
        super.tearDown()
    }

    
    func testJSONCount() {
        XCTAssertEqual(investments?.investments.count, 8)
    }

    func testPerformanceExample() throws {
        self.measure {
        }
    }
    
}
