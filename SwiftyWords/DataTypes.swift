//
//  DataTypes.swift
//  SwiftyWords
//
//  Created by Eric on 30/01/2026.
//

import Foundation

struct Category: Hashable, Identifiable, Decodable {
    var id: String { name }
    var name: String
    var description: String
    var levels: [[Word]]

    static let example = Category(name: "Example", description: "An example category", levels: [[.example]])
}

struct Word: Hashable, Decodable {
    var id: String { hint }
    var solution: String
    var hint: String
    var segments: [String]

    static let example = Word(solution: "Example solution", hint: "Example hint", segments: ["ABC", "DEF"])
}
