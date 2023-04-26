//
//  Technology.swift
//  LearningTracker
//
//  Created by Aaban Tariq Murtaza on 13/04/2023.
//

import Foundation
// iOS, Spring boot
struct Technology: LearningItem {
  var name: String
  var _completionPct: Float = 0.0
  var completionPercentage: Float {
    get {
      let sum = listOfItems.reduce(0, { partialResult, wrapper in
        partialResult + wrapper.learningItem.completionPercentage
      })
      if listOfItems.isEmpty {
        return sum
      } else {
        return (sum / Float(listOfItems.count))
      }
    }
  }
  var listOfItems: [LearningItemWrapper]
}
