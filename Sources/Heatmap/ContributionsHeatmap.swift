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

    init(data: [ContributionsHeatmapEntry]) {
        self.data = data
    }

    public var body: some View {
        Chart(data) { entry in
            RectangleMark(
                x: .value("Week", entry.week),
                y: .value("Day of week", entry.dayOfWeek),
                width: .inset(1), // TODO: add modifier for spacing
                height: .inset(1)
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
