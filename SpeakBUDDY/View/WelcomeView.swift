//
//  WelcomeView.swift
//  SpeakBUDDY
//
//  Created by Keyur Bhalodiya on 2025/03/17.
//

import SwiftUI

struct WelcomeView: View {
  
  @State private var progressAnalytics: [ProgressData] = progress_analytics
  
  var body: some View {
    NavigationStack {
      GeometryReader { geometry in
        let isLargeScreen = geometry.size.width > 600
        
        VStack {
          topCloseButton()
          
          greetingText(isLargeScreen: isLargeScreen)
          
          chartContainer(progressAnalytics)
          
          motivationalText(isLargeScreen: isLargeScreen)
          
          subscriptionButton()
          
          Spacer()
        }
        .frame(width: geometry.size.width, height: geometry.size.height)
        .background(backgroundGradient())
      }
    }
    .onAppear {
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
        animateBarsWithDelay()
      }
    }
  }
  
  /// Animates bars one by one with a delay
  private func animateBarsWithDelay() {
    for (index, _) in progressAnalytics.enumerated() {
      DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.25) {
        withAnimation(.easeInOut(duration: 0.8)) {
          progressAnalytics[index].animate = true
        }
      }
    }
  }
}

/// Close Button at the Top Right
@ViewBuilder
private func topCloseButton() -> some View {
  HStack {
    Spacer()
    Button(action: {}, label: {
      Text("×")
        .font(.system(size: 20, weight: .heavy))
        .foregroundColor(Color(hex: "#323537"))
    })
    .frame(width: 38, height: 38)
    .background(Color.white)
    .cornerRadius(19)
    .shadow(color: .black.opacity(0.26), radius: 5, x: 0, y: 2)
    .padding(.trailing, 20)
  }
}

/// Greeting Text in the center
@ViewBuilder
private func greetingText(isLargeScreen: Bool) -> some View {
  Text("Hello\nSpeakBUDDY")
    .font(.system(size: isLargeScreen ? 48 : 36, weight: .bold))
    .multilineTextAlignment(.center)
    .foregroundColor(Color(hex: "#323537"))
}

/// Motivational Text Below Chart
@ViewBuilder
private func motivationalText(isLargeScreen: Bool) -> some View {
  VStack(spacing: 8) {
    Text("スピークバディで")
      .font(.custom("Hiragino Sans", size: isLargeScreen ? 24 : 20))
      .fontWeight(.bold)
    Text("レベルアップ")
      .font(.custom("Hiragino Sans", size: isLargeScreen ? 36 : 30))
      .fontWeight(.heavy)
      .kerning(-0.57)
      .multilineTextAlignment(.center)
      .foregroundStyle(
        LinearGradient(
          gradient: Gradient(colors: [Color(hex: "#6FD4FF"), Color(hex: "#0075FF")]),
          startPoint: .top,
          endPoint: .bottom
        )
      )
  }
  .frame(maxWidth: .infinity)
  .padding()
}

/// Subscription Button
@ViewBuilder
private func subscriptionButton() -> some View {
  Button(action: {}) {
    Text("プランに登録する")
      .font(.custom("Hiragino Sans", size: 16))
      .fontWeight(.bold)
      .lineSpacing(8)
      .foregroundColor(.white)
      .padding(.horizontal, 20)
      .frame(maxWidth: 350, minHeight: 56)
      .background(Color(hex: "#3BA7FF"))
      .cornerRadius(28)
      .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 2)
      .overlay(RoundedRectangle(cornerRadius: 28).stroke(Color.white, lineWidth: 1))
  }
  .frame(maxWidth: .infinity)
  .padding()
}

/// Background Gradient
@ViewBuilder
private func backgroundGradient() -> some View {
  LinearGradient(
    gradient: Gradient(colors: [Color(hex: "#D5D2FF"), Color.white.opacity(0)]),
    startPoint: .top,
    endPoint: .bottom
  )
  .ignoresSafeArea(.all, edges: .top)
}

#Preview {
  WelcomeView()
}
