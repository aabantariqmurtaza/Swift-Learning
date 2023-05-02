//
//  PageViewController.swift
//  LearningTracker
//
//  Created by Aaban Tariq Murtaza on 30/04/2023.
//

import SwiftUI

struct PageViewController: UIViewControllerRepresentable {
  var imageNames: [String]
  @Binding var currIndex: Int
  func makeCoordinator() -> Coordinator {
    Coordinator(imageNames: imageNames,
                currIndex: $currIndex)
  }
  func makeUIViewController(context: Context) -> UIPageViewController {
    let pageVC = UIPageViewController(transitionStyle: .scroll,
                                      navigationOrientation: .horizontal)
    pageVC.delegate = context.coordinator
    pageVC.dataSource = context.coordinator
    pageVC.setViewControllers([UIHostingController(rootView: ReadingContentView(imageName: imageNames[0]))],
                              direction: UIPageViewController.NavigationDirection.forward,
                              animated: true)
    return pageVC
  }

  func updateUIViewController(_ uiViewController: UIPageViewController, context: Context) {
    //
  }

  typealias UIViewControllerType = UIPageViewController

  class Coordinator: NSObject, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    internal init(imageNames: [String],
                  currIndex: Binding<Int>) {
      self.imageNames = imageNames
      self.currIndex = currIndex
    }
    var imageNames: [String]
    var currIndex: Binding<Int>
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
      currIndex.wrappedValue -= 1
      if currIndex.wrappedValue < 0 {
        currIndex.wrappedValue = imageNames.count - 1
      }
      return UIHostingController(rootView: ReadingContentView(imageName: imageNames[currIndex.wrappedValue]))
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
      currIndex.wrappedValue += 1
      if currIndex.wrappedValue > imageNames.count - 1 {
        currIndex.wrappedValue = 0
      }
      return UIHostingController(rootView: ReadingContentView(imageName: imageNames[currIndex.wrappedValue]))
    }
  }
}

struct PageViewController_Previews: PreviewProvider {
  static var previews: some View {
    PageViewController(imageNames: ["tableViews", "collectionViews"], currIndex: .constant(0))
  }
}
