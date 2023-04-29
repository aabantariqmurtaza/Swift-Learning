//
//  LearningItemWithoutNavigationStack.swift
//  LearningTracker
//
//  Created by Aaban Tariq Murtaza on 29/04/2023.
//

import SwiftUI

struct LearningItemWithoutNavigationStack: View {
  @Binding var learningItemWrapper: LearningItemWrapper
  var body: some View {
    let _ = print("LearningItemView body \(learningItemWrapper.learningItem.completionPercentage)")
    if learningItemWrapper.learningItem is Article {
      let _ = print("Article check Passed \(learningItemWrapper.learningItem._completionPct)")
      ArticleView(progressValue: $learningItemWrapper.learningItem._completionPct)
    } else {
      let _ = print("LearningItemWithoutNavigationStack NON Article \(learningItemWrapper.learningItem.completionPercentage)")
      ListViewWithProgress(learningItemWrapper: $learningItemWrapper)
    }
  }
}

//struct LearningItemWithoutNavigationStack_Previews: PreviewProvider {
//  static var previews: some View {
//    LearningItemWithoutNavigationStack()
//  }
//}
