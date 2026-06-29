//
//  ContributionsHeatmapEntry+Date.swift
//  ContributionsHeatmap
//
//  Created by Sören Gade on 29.06.26.
//

import Foundation

public extension ContributionsHeatmapEntry {

    init?(
        on date: Date,
        in calendar: Calendar = .current,
        level: ContributionLevel
    ) {
        let dateComponents = calendar.dateComponents([.yearForWeekOfYear, .weekOfYear, .weekday], from: date)
        // use yearForWeekOfYear to avoid gaps when the year changes during the week
        guard let year = dateComponents.yearForWeekOfYear,
              let weekOfYear = dateComponents.weekOfYear,
              let weekday = dateComponents.weekday
        else {
            return nil
        }

        self.init(
            week: "\(year)-\(weekOfYear)",
            dayOfWeek: "\(weekday)",
            level: level
        )
    }

}

// MARK: Preview data

extension [ContributionsHeatmapEntry] {

    static var previewFullYear: Self {
        previewFullYear(from: .now)
    }

    static func previewFullYear(from reference: Date) -> Self {
        (0..<365)
            .reversed()
            .compactMap { offset in
                let date = reference.addingTimeInterval(Double(24 * 60 * 60 * -offset))

                return ContributionsHeatmapEntry(
                    on: date,
                    level: ContributionLevel.allCases.randomElement() ?? .none
                )
            }
    }

}
