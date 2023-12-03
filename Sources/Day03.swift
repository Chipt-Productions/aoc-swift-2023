//
//  Day03.swift
//
//
//  Created by Jade Pennig on 12/3/23.
//  Heavily based on code by Matt Pennig.
//

import Foundation

struct Line {
	let string: String
	let numberRanges: [Range<String.Index>]
	let symbolRanges: [(adjacency: Range<String.Index>, char: Character)]
}

struct Day03: AdventDay {
	var data: Data
	
	func parseLines() -> [Line] {
		data.strings().map { line in
			Line(
				string: line,
				numberRanges: line.ranges(of: #/\d+/#),
				symbolRanges: line.matches(of: #/[^0-9\.]/#).map { match in
					let range = match.range
					let char = match.output[range.lowerBound]
					
					return (
						adjacency: (line.index(before: range.lowerBound)..<line.index(after: range.upperBound)),
						char: char
					)
				}
			)
		}
	}

	func part1() -> Any {
		let lines = parseLines()
		var total = 0
		
		for index in lines.indices {
			let line = lines[index]
			
			// Filters out ranges which don't have symbol overlaps
			let ranges = line.numberRanges.filter { n in
				// compare range overlap w/ current line
				if line.symbolRanges.contains(where: { $0.adjacency.overlaps(n)}) {
					return true
				}
				
				// compare range overlap w/ prev line (if applicable)
				let prev = lines.index(before: index)
				if lines.indices.contains(prev) && lines[prev].symbolRanges.contains(where: { $0.adjacency.overlaps(n) }) {
					return true
				}
				
				// compare range overlap w/ next line (if applicable)
				let next = lines.index(after: index)
				if lines.indices.contains(next) && lines[next].symbolRanges.contains(where: { $0.adjacency.overlaps(n) }) {
					return true
				}
				
				return false
			}
			
			// returns array of all remaining numbers (ones that matched overlap)
			let numbers = ranges.compactMap {
				Int(line.string[$0])
			}
			
			// sum 'em up
			total += numbers.reduce(0, +)
		}
		
		return total
	}
	
	func part2() -> Any {
		let lines = parseLines()
		var total = 0
		
		for index in lines.indices {
			let line = lines[index]
			
			let gears = line.symbolRanges.filter {
				$0.char == "*"
			}.map(\.adjacency)
			
			let numbers = gears.reduce(into: [[Int]]()) { out, range in
				var numbers = line.numberRanges.filter({ $0.overlaps(range) }).compactMap({ Int(line.string[$0]) })
				guard numbers.count < 3 else { return }
				
				let prev = lines.index(before: index)
				if lines.indices.contains(prev) {
					numbers.append(contentsOf: lines[prev].numberRanges.filter({ $0.overlaps(range) }).compactMap({ Int(lines[prev].string[$0]) }))
				}
				guard numbers.count < 3 else { return }
				
				let next = lines.index(after: index)
				if lines.indices.contains(next) {
					numbers.append(contentsOf: lines[next].numberRanges.filter({ $0.overlaps(range) }).compactMap({ Int(lines[next].string[$0]) }))
				}
				
				if numbers.count == 2 {
					out.append(numbers)
				}
			}

			if numbers.isEmpty { continue }
			total += numbers.reduce(0) { $0 + $1.reduce(1, *) }
		}

		return total
	}
	
}
