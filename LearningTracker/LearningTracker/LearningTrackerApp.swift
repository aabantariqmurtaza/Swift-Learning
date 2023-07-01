//
//  LearningTrackerApp.swift
//  LearningTracker
//
//  Created by Aaban Tariq Murtaza on 13/04/2023.
//

import SwiftUI

@main
struct LearningTrackerApp: App {
    @State var userLearnings = DataProvider.provideLearnings()
    @State var theme = Theme(backgroundColor: Color(.white))
    var body: some Scene {
        WindowGroup {
            LearningItemView(learningItemWrapper: $userLearnings)                
                .theme(theme: $theme)
        }
    }
}
