//
//  ContentView.swift
//  LearningTracker
//
//  Created by Aaban Tariq Murtaza on 13/04/2023.
//

import SwiftUI

struct LearningItemView: View {
  @Binding var learningItemWrapper: LearningItemWrapper
  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
  
  var body: some View {
    if learningItemWrapper.learningItem is Article {
      ArticleView(progressValue: $learningItemWrapper.learningItem._completionPct,
                  sliderBindingProgress: learningItemWrapper.learningItem._completionPct)
//      below code article variable needed to be wrapped by State to make it Bindable
//      @State var article = learningItemWrapper.learningItem as! Article
//      ArticleView(progressValue: $article._completionPct)
    } else {
      if !presentationMode.wrappedValue.isPresented {
        NavigationView {
          ListViewWithProgress(learningItemWrapper: $learningItemWrapper)
        }
      } else {
        ListViewWithProgress(learningItemWrapper: $learningItemWrapper)
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    LearningItemView(learningItemWrapper: .constant(DataProvider.provideLearnings()))
  }
}
