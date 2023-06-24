//
//  ContentView.swift
//  JobsBarChart
//
//  Created by Aaban Tariq on 21/06/2023.
//

import SwiftUI

struct BarData: Identifiable {
    var id: UUID
    var pct: CGFloat
    var techName: String
}

struct HomeView: View {
    @State var barsData = [BarData(id: UUID(), pct: 80, techName: "Flutter"),
                           BarData(id: UUID(), pct: 40, techName: "iOS"),
                           BarData(id: UUID(), pct: 60, techName: "Android")]
    @State var showGraph: Bool = true
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("Technology Stats")
                Rectangle()
                    .frame(width: geometry.size.width,
                           height: 1)
                HStack {
                    Button("Show/Hide Stats") {
                        showGraph.toggle()
                    }
                    Spacer()
                }
                .foregroundColor(.black)
                .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                .buttonStyle(.bordered)
                
                if showGraph {
                    HStack(alignment: .bottom) {
                        ForEach($barsData) { $datum in
                            BarChartView(pct: $datum.pct,
                                         technologyName: datum.techName).frame(width: 70)
                        }
                    }.frame(height: geometry.size.height * 3/4)
                }
                Spacer()
                Rectangle()
                    .frame(width: geometry.size.width,
                           height: 1)
                Text("Technology Stats")
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
