//
//  PaywallLinks.swift
//  Paywall
//
//  Created by user on 27.04.2026.
//

import SwiftUI

struct PaywallLinks: View {
  @EnvironmentObject private var vm: PaywallViewModel
    var body: some View {
		HStack{
		  ForEach(LinksEnum.allCases){link in
			 Button{
				vm.proccesLinkPress(link)
			 }label: {
				Text(link.text)
				  .font(.footnote)
				  .frame(maxWidth: .infinity)
			 }
		  }
		}
    }
}

#Preview {
    PaywallLinks()
	 .environmentObject(PaywallViewModel())
}


enum LinksEnum: String, CaseIterable, Identifiable{
  case restore, terms, privacy
  
  
  var id: String{ self.rawValue }
  
  var text: String{
	 switch self {
	 case .restore:
		"Restore Purchases"
	 case .terms:
		"Therms of Use"
	 case .privacy:
		"Privacy Policy"
	 }
  }
}
