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
		data.split(separator: "\n").map {
			String($0)
		}
	}
	
	
	private func decodeNumberMessage(entries: [String]) -> Int {
		var total = 0
		
		for entry in entries {
			let numbersOnly = entry.replacing(try! Regex("[a-z]"), with: "")
			let computedNumber = Int("\(numbersOnly.first!)\(numbersOnly.last!)")
			total += computedNumber!
		}

		return total
    }
	
	private func replaceNumberWordsWithNumbers(entries: [String]) -> [String] {
		let numberWords: [Int: String] = [
			0: "zero",
			1: "one",
			2: "two",
			3: "three",
			4: "four",
			5: "five",
			6: "six",
			7: "seven",
			8: "eight",
			9: "nine"
		]
	  
		let replacedWords: [String] = entries.map {
			var newWord = String($0)
			
			// instead of replacing the characters, we write a new number entity which
			// adds a number on for every match
		  
			for (key, value) in numberWords {
				newWord = newWord.replacingOccurrences(of: value, with: String(key))
			}
		  
			return newWord
		}
		
		return replacedWords
	}

	
	// Replace this with your solution for the first part of the day's challenge.
	func part1() -> Any {
		decodeNumberMessage(entries: entities)
	}

	
	// Replace this with your solution for the second part of the day's challenge.
	func part2() -> Any {
		let replacedWords = replaceNumberWordsWithNumbers(entries: entities)
		return decodeNumberMessage(entries: replacedWords)
	}
}
