//
//  ContributionsHeatmapEntry.swift
//  ContributionsHeatmap
//
//  Created by Sören Gade on 29.06.26.
//

public struct ContributionsHeatmapEntry: Identifiable {

    public let week: String

    public let dayOfWeek: String

    public let value: Double

    public var id: String { "\(week)-\(dayOfWeek): \(value)" }

    public init(
        week: String,
        dayOfWeek: String,
        value: Double
    ) {
        self.week = week
        self.dayOfWeek = dayOfWeek
        self.value = value
    }

}

// MARK: Preview data

extension [ContributionsHeatmapEntry] {

    static var preview: Self {
        [
            ContributionsHeatmapEntry(
                week: "2",
                dayOfWeek: "0",
                value: 5
            ),
            ContributionsHeatmapEntry(
                week: "2",
                dayOfWeek: "1",
                value: 4
            ),
            ContributionsHeatmapEntry(
                week: "2",
                dayOfWeek: "2",
                value: 12
            ),
            ContributionsHeatmapEntry(
                week: "2",
                dayOfWeek: "3",
                value: 4
            ),
            ContributionsHeatmapEntry(
                week: "2",
                dayOfWeek: "4",
                value: 9
            ),
            ContributionsHeatmapEntry(
                week: "2",
                dayOfWeek: "5",
                value: 1
            ),
            ContributionsHeatmapEntry(
                week: "2",
                dayOfWeek: "6",
                value: 0
            ),
            ContributionsHeatmapEntry(
                week: "1",
                dayOfWeek: "0",
                value: 10
            ),
            ContributionsHeatmapEntry(
                week: "1",
                dayOfWeek: "1",
                value: 5
            ),
            ContributionsHeatmapEntry(
                week: "1",
                dayOfWeek: "2",
                value: 1
            ),
            ContributionsHeatmapEntry(
                week: "1",
                dayOfWeek: "3",
                value: 3
            ),
            ContributionsHeatmapEntry(
                week: "1",
                dayOfWeek: "4",
                value: 8
            ),
            ContributionsHeatmapEntry(
                week: "1",
                dayOfWeek: "5",
                value: 7
            ),
            ContributionsHeatmapEntry(
                week: "1",
                dayOfWeek: "6",
                value: 0
            ),
            ContributionsHeatmapEntry(
                week: "0",
                dayOfWeek: "0",
                value: 4
            )
        ]
    }

}
