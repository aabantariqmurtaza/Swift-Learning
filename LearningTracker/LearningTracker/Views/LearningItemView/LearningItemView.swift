//
//  ContentView.swift
//  LearningTracker
//
//  Created by Aaban Tariq Murtaza on 13/04/2023.
//

import SwiftUI

struct LearningItemView: View {
    @Binding var learningItemWrapper: LearningItemWrapper
    @State var showSettings = false
    @Environment(\.theme) var theme
    var body: some View {
        NavigationStack {
            ListViewWithProgress(learningItemWrapper: $learningItemWrapper)
                .toolbar {
                    Button("Theme") {
                        showSettings = true
                    }
                }
                .sheet(isPresented: $showSettings) {
                    SettingsView()
                }
                .background(theme.wrappedValue.backgroundColor)
        }
        .background(theme.wrappedValue.backgroundColor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LearningItemView(learningItemWrapper: .constant(DataProvider.provideLearnings()))
    }
}
