//
//  ListViewWithProgress.swift
//  LearningTracker
//
//  Created by Aaban Tariq Murtaza on 19/04/2023.
//

import SwiftUI

struct ListViewWithProgress: View {
  @Binding var learningItemWrapper: LearningItemWrapper
  var body: some View {
    GeometryReader { geometry in
      VStack {
        LinkableListView(learningItemsWrappers: $learningItemWrapper.learningItem.listOfItems)
          .navigationTitle($learningItemWrapper.learningItem.name)
        Spacer(minLength: 20)
        HStack {
          Spacer(minLength: 20)
          Text("Completion %").lineLimit(1)
          Spacer(minLength: 20)
          ProgressView(value: learningItemWrapper.learningItem.completionPercentage)
          Spacer(minLength: 20)
        }
        Spacer(minLength: geometry.size.height - CGFloat(((learningItemWrapper.learningItem.listOfItems.count) * 50)) - 20 - 20)
      }
    }
  }
}
struct ListViewWithProgress_Previews: PreviewProvider {
  static var previews: some View {
    ListViewWithProgress(learningItemWrapper: .constant(DataProvider.provideLearnings()))
  }
}
