//
//  LevelViewModel.swift
//  SwiftyWords
//
//  Created by Eric on 30/01/2026.
//

import Foundation

@MainActor
class LevelViewModel: ObservableObject {
    private(set) var answers: [Answer]
    private(set) var segments: [Segment]
    @Published var selectedSegments = [Int]()

    init(words: [Word]) {
        answers = words.map(Answer.init)
        segments = words.flatMap(\.segments).shuffled().map(Segment.init)
    }
}
