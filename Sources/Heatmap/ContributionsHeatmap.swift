//
//  ContributionsHeatmap.swift
//  ContributionsHeatmap
//
//  Created by Sören Gade on 28.06.26.
//

import SwiftUI
import Charts

public struct ContributionsHeatmap: View {

    public let data: [ContributionsHeatmapEntry]

    public let markInsets: MarkInsets

    init(
        markInsets: MarkInsets = MarkInsets(horizontal: 1, vertical: 1),
        data: [ContributionsHeatmapEntry]
    ) {
        self.data = data
        self.markInsets = markInsets
    }

    public var body: some View {
        Chart(data) { entry in
            RectangleMark(
                x: .value("Week", entry.week),
                y: .value("Day of week", entry.dayOfWeek),
                width: .inset(markInsets.horizontal),
                height: .inset(markInsets.vertical)
            )
            .foregroundStyle(by: .value("Value", entry.value))
        }
        .chartLegend(.hidden)
        .chartXAxis(.hidden)
        .chartYAxis(.hidden)
    }

}

// MARK: - Previews

#Preview {
    ContributionsHeatmap(data: .preview)
}

#Preview("Full year") {
    ContributionsHeatmap(
        markInsets: .init(horizontal: 2, vertical: 2),
        data: .previewFullYear
    )
}
