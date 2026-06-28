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
                width: .fixed(100),
                height: .fixed(100)
            )
            .foregroundStyle(by: .value("Value", entry.value))
        }
    }

}

// MARK: - ContributionsHeatmapEntry

public struct ContributionsHeatmapEntry: Identifiable {

    public let week: String

    public let dayOfWeek: String

    public let value: Double

    public var id: String { "\(week)-\(dayOfWeek): \(value)" }

}

// MARK: Preview data

private extension [ContributionsHeatmapEntry] {

    static var preview: Self {
        [
            ContributionsHeatmapEntry(
                week: "0",
                dayOfWeek: "0",
                value: 1
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
                dayOfWeek: "3",
                value: 1
            )
        ]
    }

}

// MARK: - Previews

#Preview {
    ContributionsHeatmap(data: .preview)
}
