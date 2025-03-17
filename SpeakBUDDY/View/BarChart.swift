//
//  BarChart.swift
//  SpeakBUDDY
//
//  Created by Keyur Bhalodiya on 2025/03/17.
//

import SwiftUICore
import Charts

/// Chart Container with Background Image
@ViewBuilder
func chartContainer(_ progressAnalytics: [ProgressData]) -> some View {
    ZStack {
        VStack {
            HStack {
                Image("protty")
                Spacer()
            }
            .padding([.leading, .top], 20)
            Spacer()
        }
        VStack {
            Spacer()
          animatedChart(progressAnalytics)
                .padding()
        }
        .padding()
    }
}

/// Animated Chart View
@ViewBuilder
private func animatedChart(_ progressAnalytics: [ProgressData]) -> some View {
  
  let maxViews = progressAnalytics.max { $1.value > $0.value }?.value ?? 0
  
  Chart {
    ForEach(progressAnalytics) { item in
      BarMark(
        x: .value("Title", item.title),
        y: .value("Views", item.animate ? item.value : 0)
      )
      .annotation(position: .bottom) {
        Text(item.title)
          .font(.custom("Hiragino Sans", size: 12))
          .fontWeight(.heavy)
          .foregroundColor(Color(hex: "#323537"))
          .padding(.top, 5)
      }
    }
  }
  .padding()
  .chartXAxis(.hidden)
  .chartYAxis(.hidden)
  .foregroundStyle(
    LinearGradient(
      gradient: Gradient(colors: [Color(hex: "#1F8FFF"), Color(hex: "#58C0FF")]),
      startPoint: .top,
      endPoint: .bottom
    )
  )
  .chartYScale(domain: 0...maxViews)
}

