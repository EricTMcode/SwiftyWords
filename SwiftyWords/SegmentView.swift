//
//  SegmentView.swift
//  SwiftyWords
//
//  Created by Eric on 30/01/2026.
//

import SwiftUI

struct SegmentView: View {
    var segment: Segment

    var body: some View {
        Text(segment.text)
            .opacity(segment.isUsed ? 0 : 1)
            .font(.title3)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .foregroundStyle(.white)
            .background(.indigo)
            .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}

#Preview {
    SegmentView(segment: .example)
}
