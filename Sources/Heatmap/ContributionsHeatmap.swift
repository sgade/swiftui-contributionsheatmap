//
//  ContributionsHeatmap.swift
//  ContributionsHeatmap
//
//  Created by Sören Gade on 28.06.26.
//

import SwiftUI
import Charts

public struct ContributionsHeatmap: View {

    private let markInsets: MarkInsets

    private let markCornerRadius: CGFloat

    @State
    private var data: [ContributionsHeatmapEntry]

    @Environment(\.calendar)
    private var calendar

    init(
        markInsets: MarkInsets = MarkInsets(horizontal: 1.5, vertical: 1.5),
        markCornerRadius: CGFloat = 3,
        data: [ContributionsHeatmapEntry]
    ) {
        self.data = data

        self.markInsets = markInsets
        self.markCornerRadius = markCornerRadius
    }

    public var body: some View {
        Chart(data) { entry in
            RectangleMark(
                x: .value("Week", entry.week),
                y: .value("Day of week", entry.dayOfWeek),
                width: .inset(markInsets.horizontal),
                height: .inset(markInsets.vertical)
            )
            .foregroundStyle(by: .value("Contribution level", entry.level))
            .clipShape(RoundedRectangle(cornerRadius: markCornerRadius))
        }
        .chartXAxis { xAxis }
        .chartYAxis { yAxis }
        .onChange(of: calendar, initial: true) { _, calendar in
            data = Array(data.drop(while: {
                Int($0.dayOfWeek) != calendar.firstWeekday
            }))
        }
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
            weekday: calendar.firstWeekday,
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

#Preview("ContributionsHeatmap") {
    ContributionsHeatmap(
        data: .previewFullYear
    )
    .chartForegroundStyleScale(.gitHub)
    .frame(
        width: 750,
        height: 130
    )
    .padding()
}

#Preview("Custom insets") {
    ContributionsHeatmap(
        markInsets: MarkInsets(horizontal: 4, vertical: 4),
        data: .previewFullYear
    )
    .chartForegroundStyleScale(.gitHub)
    .frame(
        width: 750,
        height: 130
    )
    .padding()
}

#Preview("In scrollview") {
    ScrollView(.horizontal) {
        ContributionsHeatmap(
            data: .previewFullYear
        )
        .frame(minWidth: 1920)
    }
    .chartForegroundStyleScale(.gitHub)
    .padding()
}

#Preview("Color schemes") {
    VStack {
        Group {
            ContributionsHeatmap(data: .previewFullYear)

            ContributionsHeatmap(data: .previewFullYear)
                .chartForegroundStyleScale(.gitHub)

            ContributionsHeatmap(data: .previewFullYear)
                .chartForegroundStyleScale(.gitLab)
        }
        .frame(
            width: 750,
            height: 130
        )
    }
    .padding()
}

#Preview("All weekdays") {
    VStack {
        ForEach(0..<7) { offset in
            ContributionsHeatmap(data: .previewFullYear(from: Date.now.addingTimeInterval(TimeInterval(offset) * 24 * 60 * 60)))
                .chartForegroundStyleScale(.gitHub)
                .chartLegend(.hidden)
                .frame(
                    width: 750,
                    height: 115
                )
        }
    }
    .padding()
}
