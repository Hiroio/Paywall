//
//  DesignViewModifiers.swift
//  Paywall
//
//  Created by user on 27.04.2026.
//

import Foundation
import SwiftUI


struct iconViewModifier: ViewModifier{
  func body(content: Content) -> some View {
	 content
		.foregroundStyle(.blue)
		.font(.footnote.bold())
		.frame(width: 25, height: 25)
		.padding(5)
		.background(
		  RoundedRectangle(cornerRadius: 10)
			 .fill(.blue.opacity(0.2))
		)
  }
}
struct ButtonViewModifier: ViewModifier{
  func body(content: Content) -> some View {
	 content
		.foregroundStyle(.white)
		.frame(maxWidth: .infinity)
		.padding()
		.background(
		  RoundedRectangle(cornerRadius: 20)
			 .fill(.blue)
		)
  }
  
  
}




extension View{
  func iconBadge() -> some View{
	 modifier(iconViewModifier())
  }
  
  func customBtn() -> some View{
	modifier(ButtonViewModifier())
  }
}
