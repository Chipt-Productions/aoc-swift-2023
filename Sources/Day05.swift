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
		let strings = data.strings()

		let seedsPattern = #/seeds:\s+(.*)/#
		let labelPattern = #/(\w+)-to-(\w+)/#
		let rangePattern = #/(\d+)\s+(\d+)\s+(\d+)/#

		// we know "seeds" is the first line, so we can pull that out directly
		let seedsSearch = try! seedsPattern.firstMatch(in: strings[0])
		let seeds = seedsSearch!.1.split(separator: #/\s+/#).compactMap{Int($0)}
		
		// create Alminac record
		var alminac = Alminac(seeds: seeds, maps: [:])
		
		// create instance of the alminac map
		var alminacMap = AlminacMap(source: "", destination: "", ranges: [])
		
		// skip first line since we already processed
		for index in 1...strings.count - 1 {
			let line = strings[index]
			let labelSearch = try! labelPattern.firstMatch(in: line)
			let rangeSearch = try! rangePattern.firstMatch(in: line)
			
			// Parse label match
			if labelSearch != nil {
				let source = String(labelSearch!.1)
				let destination = String(labelSearch!.2)
				
				// If we already have a populated AlminacMap, we are resetting alminacMap
				// to the next category, and need to save the previous set to the alminac
				if alminacMap.ranges.count > 0 {
					alminac.maps[source] = alminacMap
				}
				
				// Set base values for new AlminacMap
				alminacMap = AlminacMap(
					source: source,
					destination: destination,
					ranges: []
				)
			}
			
			// parse range match
			// add onto current alminacMap
			if rangeSearch != nil {
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
		}
		
		return alminac
	}
	
	func part1() -> Any {
		let alminac = generateAlminac()
//		print(alminac)
		
		// process each seed through each map layer
		for seed in alminac.seeds {
			print("seed:", seed)
			
			print("Seed Map", alminac.maps.keys)
			
			// start with seed map; let maps connect until end
//			var currentMap = alminac.maps
			
			
//			for rangeMap in alminac.maps {
//				for range in rangeMap.ranges {
//					print(range.range.contains(seed))
//				}
////				print(rangeMap.ranges![0].range)
//			}
		}


//		for alminacMap in alminac.maps {
//			print(alminacMap)
//		}
//		print(alminac.maps)
		
		return 0
	}
	
	func part2() -> Any {
		return 0
	}
}
