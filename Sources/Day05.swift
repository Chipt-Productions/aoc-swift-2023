//
//  Day05.swift
//
//
//  Created by Jade Pennig on 12/5/23.
//

import Foundation


struct RangeMap {
	let sourceStart: Int
	let destinationStart: Int
	let rangeNum: Int
	let range: ClosedRange<Int>
}

struct AlminacMap {
	var source: String
	var destination: String
	var ranges: [RangeMap]
}

struct Alminac {
	let seeds: [Int]
	var maps: Dictionary<String, AlminacMap>
}


struct Day05: AdventDay {
	var data: Data
	
	private func generateAlminac() -> Alminac {
		let stringGroups = data.stringGroups()
		
		let seedsPattern = #/seeds:\s+(.*)/#
		let labelPattern = #/(\w+)-to-(\w+)/#
		let rangePattern = #/(\d+)\s+(\d+)\s+(\d+)/#

		// we know "seeds" is the first line, so we can pull that out directly
		let seedsSearch = try! seedsPattern.firstMatch(in: stringGroups[0][0])
		let seeds = seedsSearch!.1.split(separator: #/\s+/#).compactMap{Int($0)}

		// create Alminac record
		var alminac = Alminac(seeds: seeds, maps: [:])
		
		// skip first group since we already processed it
		for index in 1..<stringGroups.count {
			let groupEntries = stringGroups[index]

			// first entry in the group is the label
			let labelSearch = try! labelPattern.firstMatch(in: groupEntries[0])
			let source = String(labelSearch!.1)
			let destination = String(labelSearch!.2)

			// create new AlminacMap record
			var alminacMap = AlminacMap(source: source, destination: destination, ranges: [])
			
			// add ranges to record
			for rangeIndex in 1..<groupEntries.count {
				let range = groupEntries[rangeIndex]
				let rangeSearch = try! rangePattern.firstMatch(in: range)

				let sourceStart = Int(rangeSearch!.2) ?? 0
				let destinationStart = Int(rangeSearch!.1) ?? 0
				let rangeNum = Int(rangeSearch!.3) ?? 0
				
				alminacMap.ranges.append(RangeMap(
					sourceStart: sourceStart,
					destinationStart: destinationStart,
					rangeNum: rangeNum,
					range: sourceStart...(sourceStart+rangeNum)
				))
			}
			
			// push record to alminac
			alminac.maps[source] = alminacMap
		}
		
		
		return alminac
	}
	
	func part1() -> Any {
		let alminac = generateAlminac()
		var mappedSeeds: [Int] = []

		// process each seed through each map layer
		for seed in alminac.seeds {
			var seedValue = mapThroughCategory(categoryName: "seed", runningValue: seed)
			mappedSeeds.append(seedValue)
			
			// recursive function to follow category tree until done
			func mapThroughCategory(categoryName: String, runningValue: Int) -> Int {
				let categoryMap = alminac.maps[categoryName]
				var newValue = runningValue
				
				// if the number is in the range, adjust the number
				if categoryMap != nil {
					for range in categoryMap!.ranges {
						if range.range.contains(newValue) {
							newValue = range.destinationStart + newValue - range.sourceStart
							break
						}
					}
				}
				
				// if this category has another map to follow, recurse
				if categoryMap?.destination != nil {
					newValue = mapThroughCategory(
						categoryName: categoryMap!.destination,
						runningValue: newValue
					)
				}

				return newValue
			}
		}

		return mappedSeeds.min()!
	}
	
	func part2() -> Any {
		return 0
	}
}
