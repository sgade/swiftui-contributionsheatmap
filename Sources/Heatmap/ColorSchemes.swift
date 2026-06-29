//
//  ColorSchemes.swift
//  ContributionsHeatmap
//
//  Created by Sören Gade on 29.06.26.
//

import SwiftUI

public extension KeyValuePairs where Key == ContributionLevel, Value == Color {

    static var gitHub: Self {
        [
            .none: Color(.sRGB, red: 239.0 / 255.0, green: 242.0 / 255.0, blue: 245.0 / 255.0, opacity: 1.0),
            .low: Color(.sRGB, red: 172.0 / 255.0, green: 238.0 / 255.0, blue: 187.0 / 255.0, opacity: 1.0),
            .medium: Color(.sRGB, red: 74.0 / 255.0, green: 194.0 / 255.0, blue: 107.0 / 255.0, opacity: 1.0),
            .high: Color(.sRGB, red: 45.0 / 255.0, green: 164.0 / 255.0, blue: 78.0 / 255.0, opacity: 1.0),
            .max: Color(.sRGB, red: 17.0 / 255.0, green: 99.0 / 255.0, blue: 41.0 / 255.0, opacity: 1.0)
        ]
    }

}

public extension KeyValuePairs where Key == ContributionLevel, Value == Color {

    static var gitLab: Self {
        [
            .none: Color(.sRGB, red: 236.0 / 255.0, green: 236.0 / 255.0, blue: 239.0 / 255.0, opacity: 1.0),
            .low: Color(.sRGB, red: 210.0 / 255.0, green: 220.0 / 255.0, blue: 255.0 / 255.0, opacity: 1.0),
            .medium: Color(.sRGB, red: 121.0 / 255.0, green: 146.0 / 255.0, blue: 245.0 / 255.0, opacity: 1.0),
            .high: Color(.sRGB, red: 78.0 / 255.0, green: 101.0 / 255.0, blue: 205.0 / 255.0, opacity: 1.0),
            .max: Color(.sRGB, red: 48.0 / 255.0, green: 52.0 / 255.0, blue: 112.0 / 255.0, opacity: 1.0)
        ]
    }

}
