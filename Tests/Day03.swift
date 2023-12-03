//
//  File.swift
//  
//
//  Created by Jade Pennig on 12/3/23.
//

import XCTest

@testable import AdventOfCode

final class Day03Tests: XCTestCase {
	func testPart1() throws {
		let testData = """
			467..114..
			...*......
			..35..633.
			......#...
			617*......
			.....+.58.
			..592.....
			......755.
			...$.*....
			.664.598..
			""" // sum of all numbers adjacent to symbols
		
		let challenge = Day03(data: testData.data(using: .utf8)!)
		XCTAssertEqual(String(describing: challenge.part1()), "4361")
	}
	
	func testPart2() throws {
		let testData = """
			467..114..
			...*......
			..35..633.
			......#...
			617*......
			.....+.58.
			..592.....
			......755.
			...$.*....
			.664.598..
			""" // summed product of numbers for * symbols with two adjacent numbers
		
		let challenge = Day03(data: testData.data(using: .utf8)!)
		XCTAssertEqual(String(describing: challenge.part2()), "467835")
	}
}
