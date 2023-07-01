//
//  SettingsView.swift
//  LearningTracker
//
//  Created by Aaban Tariq on 01/07/2023.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.theme) var theme
    var body: some View {
        VStack {
            Button("Red theme") {
                theme.wrappedValue.backgroundColor = Color(uiColor: .red)
            }
            .buttonStyle(.bordered)
            Button("Green theme") {
                theme.wrappedValue.backgroundColor = Color(uiColor: .green)
            }
            .buttonStyle(.bordered)
            Button("White") {
                theme.wrappedValue.backgroundColor = Color(uiColor: .white)
            }
            .buttonStyle(.bordered)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
