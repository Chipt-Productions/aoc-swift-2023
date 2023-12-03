//
//  Day02.swift
//
//
//  Created by Jade Pennig on 12/2/23.
//

import Foundation

struct Day02: AdventDay {
	// Save your data in a corresponding text file in the `Data` directory.
	var data: Data

	// Constants for cube counts
	let cubeCounts = [
		"red": 12,
		"green": 13,
		"blue": 14
	]
	
	/**
	 * Parses data to provide structured data set for code challenge.
	 */
	var games: [[String: [[String: Int]]]] {
		string.split(separator: "\n").map {
			// 1. Parse the game ID
			let gameIndexPattern = #/Game (\d+)/#
			var gameIndex: String = ""
			
			if let gameIndexSearch = try! gameIndexPattern.firstMatch(in: String($0)) {
				gameIndex = String(gameIndexSearch.1)
			}
			
			// 2. Parse the data for each game
			let gamesPattern = #/: (.*)/#
			var gamesList: [Substring] = []
			
			if let gameDataSearch = try! gamesPattern.firstMatch(in: String($0)) {
				gamesList = gameDataSearch.1.split(separator: ";").map {
					return $0
				}
			}
			
			// 3. Parse the data for each pull of the dice
			let pullCountPattern = #/(\d+) (\w+)/#
			var gameData: [[String: Int]] = []

			for game in gamesList {
				let pulls = game.split(separator: ",")
				var pullData: [String: Int] = [:]

				for pull in pulls {
					if let pullCountSearch = try! pullCountPattern.firstMatch(in: pull) {
						pullData[String(pullCountSearch.2)] = Int(pullCountSearch.1)
					}
				}

				gameData.append(pullData)
			}
			
			return [
				gameIndex: gameData
			]
		}
	}
		
	
	/**
	 * Determines if the game result is a valid game based on the cube restraints
	 * If it is a valid game, it returns the ID of the game. If it is not, it returns 0.
	 */
	private func isGamePossible(game: [[String: Int]]) -> Bool {
		// valid until proven invalid
		var isValidGame = true
		
		for grab in game {
			for color in grab {
				if (cubeCounts[color.key] ?? 0 < color.value) {
					isValidGame = false
				}
			}
		}
		
		return isValidGame
	}
	
	/**
	 * Gets the minimum of cubes needed per color to make a valid game, and returns the
	 * multiplication of the cube color couts
	 */
	private func getProductOfMinCubes(game: [[String: Int]]) -> Int {
		var neededColors = [
			"red": 0,
			"green": 0,
			"blue": 0
		]
		
		for grab in game {
			for color in grab {
				if (color.value > neededColors[color.key]!) {
					neededColors[color.key] = color.value
				}
			}
		}
		
		return neededColors["red"]! * neededColors["green"]! * neededColors["blue"]!
	}
	
	
	// Solving Part 1 of the daily challenge
	func part1() -> Any {
		var total: Int = 0
		
		for game in games {
			if isGamePossible(game: game.values.first!) {
				total += Int(game.keys.first ?? "0")!
			}
		}

		return total
	}

	
	// Solving Part 2 of the daily challenge
	func part2() -> Any {
		var total = 0
		
		for game in games {
			total += getProductOfMinCubes(game: game.values.first!)
		}
		
		return total
	}
}
