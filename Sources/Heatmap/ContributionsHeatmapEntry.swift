//
//  ContributionsHeatmapEntry.swift
//  ContributionsHeatmap
//
//  Created by Sören Gade on 29.06.26.
//

public struct ContributionsHeatmapEntry: Identifiable, Equatable, Sendable {

    public let week: String

    public let dayOfWeek: String

    public let level: ContributionLevel

    public var id: String { "\(week)-\(dayOfWeek): \(level.rawValue)" }

    public init(
        week: String,
        dayOfWeek: String,
        level: ContributionLevel
    ) {
        self.week = week
        self.dayOfWeek = dayOfWeek
        self.level = level
    }

}
