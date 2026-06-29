//
//  ContributionLevel.swift
//  ContributionsHeatmap
//
//  Created by Sören Gade on 29.06.26.
//

import Charts

public enum ContributionLevel: String, CaseIterable, Plottable, Sendable {

    case none
    case low
    case medium
    case high
    case max

}
