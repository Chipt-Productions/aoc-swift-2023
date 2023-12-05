//
//  Day04.swift
//
//
//  Created by Jade Pennig on 12/4/23.
//

import Foundation

struct Scratchcard {
	let card: Int
	let winningNumbers: Set<Int>
	let numWinners: Int
}

struct Day04: AdventDay {
	var data: Data
	
	private func getScratchcards() -> [Scratchcard] {
		data.strings().map { card in
			let cardRegex = #/Card\s+(\d+): ([\s+\d+]+)\|([\s+\d+]+)/#
			let cardParts = try! cardRegex.firstMatch(in: card)
			let cardIndexMatch = cardParts?.1 ?? "0"
 			let cardIndex = Int(cardIndexMatch)!
			
			let winners = Set(cardParts!.2.split(separator: #/\s+/#).compactMap{Int($0)})
			let numbers = Set(cardParts!.3.split(separator: #/\s+/#).compactMap{Int($0)})
			let winningNumbers = numbers.intersection(winners)
			
			return Scratchcard(card: cardIndex, winningNumbers: winningNumbers, numWinners: winningNumbers.count)
		}

	}
	
	func part1() -> Any {
		let scratchcards = getScratchcards()
		var totalScore = 0
		
		for scratchcard in scratchcards {
			totalScore += scratchcard.winningNumbers.reduce(0) { partialResult, _ in
				return partialResult == 0 ? 1 : partialResult * 2
			}
		}
		
		return totalScore
	}
	
	func part2() -> Any {
		var scratchcards = getScratchcards()
		var currentIndex = 0
		
		while currentIndex < scratchcards.count {
			let scratchcard = scratchcards[currentIndex]
			var gameNumToAdd = scratchcard.card + 1
			
			if (scratchcard.numWinners > 0) {
				for _ in 1...scratchcard.numWinners {
					scratchcards.append(scratchcards[gameNumToAdd - 1])

					gameNumToAdd += 1
				}
			}

			currentIndex += 1
		}
		
		return scratchcards.count
	}
}
