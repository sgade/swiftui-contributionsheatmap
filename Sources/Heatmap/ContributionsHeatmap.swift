//
//  ContributionsHeatmap.swift
//  ContributionsHeatmap
//
//  Created by Sören Gade on 28.06.26.
//

import SwiftUI
import Charts

public struct ContributionsHeatmap: View {

    private let data: [ContributionsHeatmapEntry]

    private let markInsets: MarkInsets

    @Environment(\.calendar)
    private var calendar

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
        .chartXAxis { xAxis }
        .chartYAxis { yAxis }
    }

}

// MARK: Axes

private extension ContributionsHeatmap {

    @AxisContentBuilder
    var xAxis: some AxisContent {
        AxisMarks(preset: .aligned, position: .top) { value in
            if let date = yAxisFormattingDate(value: value) {
                AxisValueLabel {
                    Text("\(date.formatted(.dateTime.month(.abbreviated)))")
                }
            }
        }
    }

    func yAxisFormattingDate(value: AxisValue) -> Date? {
        guard let strings = value.as(String.self)?.split(separator: "-"),
           let year = Int(String(strings[0])),
           let weekOfYear = Int(String(strings[1]))
        else {
            return nil
        }

        let components = DateComponents(
            calendar: calendar,
            year: year,
            weekday: 1,
            weekOfYear: weekOfYear
        )

        guard let weekDate = calendar.date(from: components) else {
            return nil
        }
        let monthComponents = calendar.dateComponents([.weekOfMonth], from: weekDate)

        // show for first week of each month
        guard let weekOfMonth = monthComponents.weekOfMonth,
           weekOfMonth == 1
        else {
            return nil
        }

        return weekDate
    }

    @AxisContentBuilder
    var yAxis: some AxisContent {
        AxisMarks(preset: .aligned) { value in
            if let stringValue = value.as(String.self),
               let dayOfWeek = Int(stringValue),
               dayOfWeek % 2 == 0 {
                AxisValueLabel {
                    Text(calendar.shortWeekdaySymbols[dayOfWeek - 1])
                }
            }
        }
    }

}

// MARK: - Previews

#Preview {
    ContributionsHeatmap(data: .preview)
}

#Preview("Full year") {
    ContributionsHeatmap(
        data: .previewFullYear
    )
}

#Preview("Full year (custom insets)") {
    ContributionsHeatmap(
        markInsets: MarkInsets(horizontal: 2, vertical: 2),
        data: .previewFullYear
    )
}

#Preview("In scrollview") {
    ScrollView(.horizontal) {
        ContributionsHeatmap(
            data: .previewFullYear
        )
        .frame(minWidth: 1920)
    }
}
