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
        markInsets: MarkInsets = MarkInsets(horizontal: 1.5, vertical: 1.5),
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
            .clipShape(RoundedRectangle(cornerRadius: 3))
        }
        .chartXAxis { xAxis }
        .chartYAxis { yAxis }
        .foregroundStyle(.blue)
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

#Preview("GitHub") {
    ContributionsHeatmap(data: .previewFullYear)
        .chartForegroundStyleScale { (value: Double) in
            switch value {
            case 0:
                Color(.sRGB, red: 239.0 / 255.0, green: 242.0 / 255.0, blue: 245.0 / 255.0, opacity: 1.0)

            case 0..<10:
                Color(.sRGB, red: 172.0 / 255.0, green: 238.0 / 255.0, blue: 187.0 / 255.0, opacity: 1.0)

            case 10..<20:
                Color(.sRGB, red: 74.0 / 255.0, green: 194.0 / 255.0, blue: 107.0 / 255.0, opacity: 1.0)

            case 20..<30:
                Color(.sRGB, red: 45.0 / 255.0, green: 164.0 / 255.0, blue: 78.0 / 255.0, opacity: 1.0)

            case 30:
                fallthrough
            default:
                Color(.sRGB, red: 17.0 / 255.0, green: 99.0 / 255.0, blue: 41.0 / 255.0, opacity: 1.0)
            }
        }
        .frame(
            width: 800,
            height: 120
        )
}
