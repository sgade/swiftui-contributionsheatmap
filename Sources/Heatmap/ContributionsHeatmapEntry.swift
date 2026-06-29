//
//  ContributionsHeatmapEntry.swift
//  ContributionsHeatmap
//
//  Created by Sören Gade on 29.06.26.
//

public struct ContributionsHeatmapEntry: Identifiable, Equatable, Sendable {

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
