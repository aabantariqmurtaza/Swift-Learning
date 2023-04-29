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
    NavigationStack {
      ListViewWithProgress(learningItemWrapper: $learningItemWrapper)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    LearningItemView(learningItemWrapper: .constant(DataProvider.provideLearnings()))
  }
}
