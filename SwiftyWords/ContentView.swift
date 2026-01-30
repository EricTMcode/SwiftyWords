//
//  ContentView.swift
//  SwiftyWords
//
//  Created by Eric on 30/01/2026.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var model: LevelViewModel

    init() {
        _model = StateObject(wrappedValue: {
            let category = Bundle.main.decode(Category.self, from: "Animals.json")
            return LevelViewModel(words: category.levels[0])
        }())
    }

    var body: some View {
        VStack {
            VStack {
                ForEach(model.answers) { answer in
                    HStack {
                        if answer.isSolved {
                            Text(answer.word.solution)
                        } else {
                            Text(answer.word.hint)
                            Spacer()
                            Image(systemName: answer.imageName)
                        }
                    }
                    .font(.title3)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .bold(answer.isSolved)

                    Spacer()
                }
            }

            Text(model.currentAnswer)
                .font(.title)
                .lineLimit(1)
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.quaternary)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .overlay(alignment: .trailing) {
                    Button(action: model.delete) {
                        Label("Delete", systemImage: "delete.left")
                            .font(.title)
                            .labelStyle(.iconOnly)
                    }
                    .buttonStyle(.plain)
                    .offset(x: -10)
                }

            Spacer()

            LazyVGrid(columns: Array<GridItem>(repeating: .init(.flexible()), count: 4)) {
                ForEach(0..<model.segments.count, id: \.self) { index in
                    let segment = model.segments[index]
                    Button {
                        model.select(index)
                    } label: {
                        SegmentView(segment: segment)
                    }
                    .buttonStyle(.plain)
                    .disabled(segment.isUsed)
                    .disabled(model.selectedSegments.count == 7)
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
