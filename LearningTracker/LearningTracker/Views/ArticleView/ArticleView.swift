//
//  ArticleView.swift
//  LearningTracker
//
//  Created by Aaban Tariq Murtaza on 20/04/2023.
//

import SwiftUI


struct ArticleView: View {
  // I connected Slider with progressValue first. But changing this binding value dismisses VC.
  // So i created a @State in this View.
  @Binding var progressValue: Float
  @Environment(\.dismiss) var dismiss
  var body: some View {
    VStack {
      Slider(value: $progressValue)
      Button("Done") {
        dismiss()
      }
    }
  }
}

struct ArticleView_Previews: PreviewProvider {
  static var previews: some View {
    ArticleView(progressValue: .constant(0.0))
  }
}
