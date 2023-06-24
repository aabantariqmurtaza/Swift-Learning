//
//  BarChartView.swift
//  JobsBarChart
//
//  Created by Aaban Tariq on 21/06/2023.
//

import SwiftUI

struct BarChartView: View {
    @Binding var pct: CGFloat
    @State var barValue: CGFloat = 0
    @State var showText: Bool = false
    var technologyName: String
    var body: some View {
        GeometryReader { proxy in
            VStack {
                Spacer()
                if showText {
                    Text(AttributedString(technologyName))
                        .italic()
                        .rotationEffect(Angle(degrees: -30))
                }
                Rectangle()
                    .foregroundColor(Color.yellow)
                    .frame(width: proxy.size.width, height: proxy.size.height * barValue / 100)
                    .animation(.easeInOut(duration: 2), value: barValue)
                    .onAppear {
                        barValue = pct
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            showText = true
                        }
                    }
            }
        }
    }
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartView(pct: .constant(5), technologyName: "Flutter")
    }
}


