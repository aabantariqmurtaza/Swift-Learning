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
  @State var currIndex = 0
  var body: some View {
    VStack {
      HStack {
        Spacer()
        PageViewController(imageNames: ["tableViews", "collectionViews"],
                           currIndex: $currIndex)
        Spacer()
      }
      HStack {
        Spacer(minLength: 300)
        PageControl(selectedIndex: $currIndex)
        Spacer(minLength: 20)
      }
      
      Text("Set Completion Pct")
      HStack {
        Spacer(minLength: 50)
        Slider(value: $progressValue)
        Spacer(minLength: 50)
      }
      Button("Done") {
        dismiss()
      }
      .buttonStyle(.bordered)
      .padding(EdgeInsets(top: 4,
                          leading: 8,
                          bottom: 4,
                          trailing: 8))
      Spacer(minLength: 250)
    }
  }
}

struct ArticleView_Previews: PreviewProvider {
  static var previews: some View {
    ArticleView(progressValue: .constant(0.0))
  }
}
