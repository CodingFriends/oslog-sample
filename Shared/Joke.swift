//
//  Joke.swift
//  OSLog Sample
//
//  Created by Gabriel Reimers on 20.04.22.
//

import Foundation
import os

struct Joke: Codable {
    var value: String
    private let log = Logger(subsystem: "com.coding-friends.oslog-sample", category: "Joke")
    
    private enum CodingKeys: String, CodingKey {
        case value
    }
    
    mutating func gabify() {
        let newValue = value.replacingOccurrences(of: "Chuck Norris", with: "Gabriel")
        let oldValue = value
        log.notice("gabifying \(oldValue) to \(newValue)")
        value = newValue
    }
}

