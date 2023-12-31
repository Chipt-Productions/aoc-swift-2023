//
//  Data+.swift
//
//  Helper functions for efficient data parsing.
//
//
//  Created by Matt Pennig on 12/2/23.
//

import Foundation

extension Data {
		func strings() -> [String] {
				withUnsafeBytes {
						return $0.split(separator: UInt8(ascii: "\n"), omittingEmptySubsequences: true).map {
								String(decoding: UnsafeRawBufferPointer(rebasing: $0), as: UTF8.self)
						}
				}
		}

		func substrings() -> [Substring] {
				withUnsafeBytes {
						return $0.split(separator: UInt8(ascii: "\n"), omittingEmptySubsequences: true).map {
								Substring(decoding: UnsafeRawBufferPointer(rebasing: $0), as: UTF8.self)
						}
				}
		}

		func stringGroups() -> [[String]] {
				withUnsafeBytes {
						$0.split(separator: UInt8(ascii: "\n"), omittingEmptySubsequences: false)
								.split(whereSeparator: { $0.isEmpty })
								.map {
										$0.map {
												String(decoding: UnsafeRawBufferPointer(rebasing: $0), as: UTF8.self)
										}
								}
				}
		}
}
