//
//  LearningItem.swift
//  LearningTracker
//
//  Created by Aaban Tariq Murtaza on 15/04/2023.
//

import Foundation

protocol LearningItem {
  var name: String { get set }
  var _completionPct: Float { get set }
  var completionPercentage: Float { get }
  var listOfItems: [LearningItemWrapper] { get set }
}
// I created a concrete type conforming Identifiable, as ListView takes only concrete types.
// First i made above protocol Identifiable, but List(learningItems) was giving error. That 'any Learning' is not identifiable.
struct LearningItemWrapper: Identifiable {
  internal init(learningItem: LearningItem) {
    self.id = UUID()
    self.learningItem = learningItem
  }
  var id: UUID
  var learningItem: LearningItem
}
