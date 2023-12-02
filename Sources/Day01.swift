//
//  Day01.swift
//
//
//  Created by Jade Pennig on 12/1/23.
//

import Foundation
import Algorithms

struct Day01: AdventDay {
	// Save your data in a corresponding text file in the `Data` directory.
	var data: String

	// Splits input data into an array by splitting newlines
	var entities: [String] {
		// map through the entries to convert from Substring to String type
		data.split(separator: "\n").map {
			String($0)
		}
	}
	
	/**
	 * Performs the requested decode on the data set by removing all letters from each entry,
	 * creating an Int with the first and last matched numbers in the reduced string.
	 *
	 * Adds numbers up and returns the total for the set.
	 */
	private func decodeNumberMessage(entries: [String]) -> Int {
		var total = 0
		
		for entry in entries {
			let numbersOnly = entry.replacing(try! Regex("[a-z]"), with: "")
			let computedNumber = Int("\(numbersOnly.first!)\(numbersOnly.last!)")
			
			total += computedNumber!
		}

		return total
    }
	
	/**
	 * This is sort of a hack. A string like "zerone" should resolve as "01" even though there's not exclusivity in the letters.
	 * By retaining the first and last letters, we allow for matches on shared borders.
	 * No two number words overlap more than one character.
	 */
	private func replaceNumberWordsWithNumbers(entries: [String]) -> [String] {
		let numberWords: [String: String] = [
			"z0o": "zero",
			"o1e": "one",
			"t2o": "two",
			"t3e": "three",
			"f4r": "four",
			"f5e": "five",
			"s6x": "six",
			"s7n": "seven",
			"e8t": "eight",
			"n9e": "nine"
		]
	  
		let replacedWords: [String] = entries.map {
			var newWord = String($0)
			
			for (key, value) in numberWords {
				newWord = newWord.replacingOccurrences(of: value, with: key)
			}
			
			return newWord
		}
		
		return replacedWords
	}

	
	// Solving Part 1 of the daily challenge
	func part1() -> Any {
		decodeNumberMessage(entries: entities)
	}

	
	// Solving Part 2 of the daily challenge
	func part2() -> Any {
		let replacedWords = replaceNumberWordsWithNumbers(entries: entities)
		return decodeNumberMessage(entries: replacedWords)
	}
}
