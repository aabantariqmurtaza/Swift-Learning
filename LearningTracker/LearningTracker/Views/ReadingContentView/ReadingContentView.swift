//
//  ReadingContentView.swift
//  LearningTracker
//
//  Created by Aaban Tariq Murtaza on 30/04/2023.
//

import SwiftUI

struct ReadingContentView: View {
  @State var imageName: String
  var body: some View {
    VStack {
      Image(imageName)
        .resizable()
        .aspectRatio(contentMode: .fit)
      Button("Read More . . .") {
        //
      }
      .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
      .background(RoundedRectangle(cornerSize: CGSize(width: 2, height: 2)))
    }
    .padding(EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4 ))
    .border(.black, width: 1)
  }
}

struct ReadingContentView_Previews: PreviewProvider {
  static var previews: some View {
    ReadingContentView(imageName: "tableViews")
  }
}
