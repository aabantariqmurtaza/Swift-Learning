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
  @State var sliderBindingProgress: Float
  var body: some View {
    VStack {
      Slider(value: $sliderBindingProgress)
      Button("Done") {
        progressValue = sliderBindingProgress
      }
    }
  }
}

struct ArticleView_Previews: PreviewProvider {
  static var previews: some View {
    ArticleView(progressValue: .constant(0.0), sliderBindingProgress: 0.0)
  }
}
