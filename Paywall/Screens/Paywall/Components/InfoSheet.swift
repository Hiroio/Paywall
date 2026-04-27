//
//  InfoSheet.swift
//  Paywall
//
//  Created by user on 27.04.2026.
//

import SwiftUI

struct InfoSheet: View {
  @Environment(\.dismiss) private var dismiss
  let link: LinksEnum?
    var body: some View {
		VStack{
		  Button{
			 dismiss()
		  }label: {
			 Image(systemName: "xmark")
				.foregroundStyle(.white)
				.padding(10)
				.background(
				  Circle()
					 .fill(
						.black.opacity(0.2)
					 )
				)
				.padding()
		  }
		  .frame(maxWidth: .infinity, alignment: .trailing)
		  switch link {
		  case .restore:
			 Text(LinksEnum.restore.text)
				.font(.largeTitle)
		  case .terms:
			 Text(LinksEnum.terms.text)
				.font(.largeTitle)
		  default:
			 EmptyView()
		  }
		 
		  Spacer()
		  
		}
    }
}

#Preview {
  InfoSheet(link: .privacy)
}
