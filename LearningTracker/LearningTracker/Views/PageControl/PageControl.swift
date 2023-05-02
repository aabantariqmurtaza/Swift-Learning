//
//  PageControl.swift
//  LearningTracker
//
//  Created by Aaban Tariq Murtaza on 01/05/2023.
//

import SwiftUI

struct PageControl: UIViewRepresentable {
  typealias UIViewType = UIPageControl
  var numberOfPages = 2
  @Binding var selectedIndex: Int
  
  func makeUIView(context: Context) -> UIPageControl {
    let pageControl = UIPageControl()
    pageControl.numberOfPages = numberOfPages
    pageControl.currentPage = selectedIndex
    pageControl.backgroundColor = .lightGray
    return pageControl
  }
  
  func updateUIView(_ uiView: UIPageControl, context: Context) {
    uiView.currentPage = selectedIndex
  }
}

struct PageControl_Previews: PreviewProvider {
    static var previews: some View {
      PageControl(selectedIndex: .constant(1))
    }
}
