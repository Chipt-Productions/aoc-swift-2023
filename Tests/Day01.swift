//
//  Day01.swift
//
//
//  Created by Jade on 12/1/23.
//

import XCTest

@testable import AdventOfCode

// Make a copy of this file for every day to ensure the provided smoke tests
// pass.
final class Day01Tests: XCTestCase {
	func testPart1() throws {
		let testData = """
		one8sd2d2
		1sixseven29
		oo2dd
		""" // 82 + 19 + 22 = 123

		let challenge = Day01(data: testData)
		XCTAssertEqual(String(describing: challenge.part1()), "123")
	}
	
	func testPart2() throws {
		let testData = """
		1eightwo
		two0
		eightwo
		7
		""" // 12 + 20 + 82 + 77 = 191
		
		let challenge = Day01(data: testData)
		XCTAssertEqual(String(describing: challenge.part2()), "191")
	}
}
