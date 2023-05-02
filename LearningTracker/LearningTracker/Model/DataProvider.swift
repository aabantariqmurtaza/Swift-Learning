//
//  DataProvider.swift
//  LearningTracker
//
//  Created by Aaban Tariq Murtaza on 13/04/2023.
//

import Foundation

struct DataProvider {
  static func provideLearnings() -> LearningItemWrapper {
    let swiftUI = Article(name: "Swift UI",
                          listOfItems: [], readingContentImages: ["Binding", "StateBinding"])
    let swiftUIWrapper = LearningItemWrapper(learningItem: swiftUI)
    let learningItemUIKit = Article(name: "UIKit",
                                    listOfItems: [], readingContentImages: ["collectionViews", "tableViews"])
    let uiKitWrapper = LearningItemWrapper(learningItem: learningItemUIKit)
    let learningItemIOS = Technology(name: "iOS",
                                     listOfItems: [uiKitWrapper, swiftUIWrapper])
    let iOSWrapper = LearningItemWrapper(learningItem: learningItemIOS)
    
    let learningItemAndroid = Technology(name: "android",
                                         listOfItems: [])
    let androidWrapper = LearningItemWrapper(learningItem: learningItemAndroid)
    let springBoot = Technology(name: "Spring Boot",
                                listOfItems: [])
    let springWrapper = LearningItemWrapper(learningItem: springBoot)
    let backEnd = LearningArea(name: "Back End",
                               listOfItems: [springWrapper])
    let backWrapper = LearningItemWrapper(learningItem: backEnd)
    let frontEnd = LearningArea(name: "Front End",
                                listOfItems: [iOSWrapper, androidWrapper])
    let frontEndWrapper = LearningItemWrapper(learningItem: frontEnd)
    
    let userLearning = UserLearning(name: "My Learning",
                                    listOfItems: [frontEndWrapper, backWrapper])
    let userLearningWrapper = LearningItemWrapper(learningItem: userLearning)
    
    return userLearningWrapper
  }
}
