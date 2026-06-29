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
        value: Double
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
            value: value
        )
    }

}

// MARK: Preview data

extension [ContributionsHeatmapEntry] {

    static var previewFullYear: Self {
        let reference = Date.now

        let values = (0..<365).compactMap { offset in
            let date = reference.addingTimeInterval(Double(24 * 60 * 60 * offset))

            return ContributionsHeatmapEntry(
                on: date,
                value: Double.random(in: 0...30)
            )
        }
        return values
    }

}
