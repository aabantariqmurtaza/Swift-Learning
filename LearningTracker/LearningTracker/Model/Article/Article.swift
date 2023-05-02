//
//  TechnologyArtciles.swift
//  LearningTracker
//
//  Created by Aaban Tariq Murtaza on 13/04/2023.
//

import Foundation
// SwiftUI
struct Article: LearningItem {
  var name: String
  var _completionPct: Float = 0.0
  var completionPercentage: Float {
    get {
      _completionPct
    }
    set {
      _completionPct = newValue
    }
  }
  var listOfItems: [LearningItemWrapper]
  var readingContentImages: [String]
}
