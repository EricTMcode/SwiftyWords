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

    var currentAnswer: String {
        if selectedSegments.isEmpty {
            return " "
        } else {
            return selectedSegments.map { segments[$0].text }.joined()
        }
    }

    func select(_ index: Int) {
        segments[index].isUsed = true
        selectedSegments.append(index)

        let userAnswer = currentAnswer

        let match = answers.firstIndex {
            $0.word.solution == userAnswer
        }

        if let match {
            selectedSegments.removeAll()
            answers[match].isSolved = true
        }
    }

    func delete() {
        if let removed = selectedSegments.popLast() {
            segments[removed].isUsed = false
        }
    }
}
