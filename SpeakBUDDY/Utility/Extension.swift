//
//  Extension.swift
//  SpeakBUDDY
//
//  Created by Keyur Bhalodiya on 2025/03/17.
//

import SwiftUICore

extension Color {
  // Custom initializer to support hex color code
  init(hex: String, alpha: Double = 1.0) {
    // Clean the string by removing # if present
    let hexString = hex.replacingOccurrences(of: "#", with: "")
    
    // Ensure the string is the correct length
    let scanner = Scanner(string: hexString)
    var hexNumber: UInt64 = 0
    
    if scanner.scanHexInt64(&hexNumber) {
      let red = Double((hexNumber & 0xFF0000) >> 16) / 255.0
      let green = Double((hexNumber & 0x00FF00) >> 8) / 255.0
      let blue = Double(hexNumber & 0x0000FF) / 255.0
      
      self.init(red: red, green: green, blue: blue, opacity: alpha)
    } else {
      // If the hex code is invalid, default to black color
      self.init(red: 0, green: 0, blue: 0, opacity: alpha)
    }
  }
}
