//
//  ProgressData.swift
//  SpeakBUDDY
//
//  Created by Keyur Bhalodiya on 2025/03/17.
//

import Foundation

struct ProgressData: Identifiable {
  var id = UUID().uuidString
  var title: String
  var value: Double
  var animate: Bool = false
}

var progress_analytics: [ProgressData] = [
  ProgressData(title: "現在", value: 66, animate: false),
  ProgressData(title: "3ヶ月", value: 100, animate: false),
  ProgressData(title: "1年", value: 220, animate: false),
  ProgressData(title: "2年", value: 300,animate: false)
]
