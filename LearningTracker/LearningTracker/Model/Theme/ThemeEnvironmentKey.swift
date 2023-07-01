//
//  ThemeEnvironmentKey.swift
//  LearningTracker
//
//  Created by Aaban Tariq on 01/07/2023.
//

import Foundation
import SwiftUI

fileprivate struct ThemeEnvironmentKey: EnvironmentKey {
    static var defaultValue: Binding<Theme> = .constant(Theme(backgroundColor: .init(uiColor: .white)))
    typealias Value = Binding<Theme>
}

extension EnvironmentValues {
    var theme: Binding<Theme> {
        get { self[ThemeEnvironmentKey.self] }
        set { self[ThemeEnvironmentKey.self] = newValue }
    }
}

extension View {
    func theme(theme: Binding<Theme>) -> some View{
        environment(\.theme, theme)
    }
}
