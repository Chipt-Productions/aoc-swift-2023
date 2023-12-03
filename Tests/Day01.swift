//
//  Day01.swift
//
//
//  Created by Jade Pennig on 12/1/23.
//

import XCTest

@testable import AdventOfCode

final class Day01Tests: XCTestCase {
	func testPart1() throws {
		let testData = """
			one8sd2d2
			1sixseven29
			oo2dd
			""" // 82 + 19 + 22 = 123
		
		let challenge = Day01(data: testData.data(using: .utf8)!)
		XCTAssertEqual(String(describing: challenge.part1()), "123")
	}
	
	func testPart2() throws {
		let testData = """
			1eightwo
			eightwo1
			two0
			eightwo
			7
			""" // 12 + 81 + 20 + 82 + 77 = 272
		
		let challenge = Day01(data: testData.data(using: .utf8)!)
		XCTAssertEqual(String(describing: challenge.part2()), "272")
	}
}
