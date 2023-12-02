//
//  File.swift
//
//
//  Created by Jade on 12/2/23.
//

import XCTest

@testable import AdventOfCode

final class Day02Tests: XCTestCase {
	func testPart1() throws {
		let testData = """
			Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
			Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
			Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
			Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
			Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
			""" // games 3 and 4 are impossible, leaving 1 + 2 + 5 = 8
		
		let challenge = Day02(data: testData)
		XCTAssertEqual(String(describing: challenge.part1()), "8")
	}
	
	func testPart2() throws {
		let testData = """
			Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
			Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
			Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
			Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
			Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
			""" 
			// game 1 min cubes: 4 red, 2 green, 6 blue = 4 * 2 * 6 = 48
			// game 2 min cubes: 3 green, 4 blue, 1 red = 2 * 3 * 4 = 24
			// game 3 min cubes: 13 green, 6 blue, 20 red = 13 * 6 * 20 = 1560
			// game 4 min cubes: 3 green, 15 blue, 14 red = 3 * 15 * 14 = 630
			// game 5 min cubes: 3 green, 2 blue, 6 red = 3 * 2 * 6 = 36
			// game totals = 2286

		let challenge = Day02(data: testData)
		XCTAssertEqual(String(describing: challenge.part2()), "2286")
	}
}
