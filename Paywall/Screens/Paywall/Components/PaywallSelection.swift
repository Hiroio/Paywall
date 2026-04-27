//
//  PaywallSelection.swift
//  Paywall
//
//  Created by user on 27.04.2026.
//

import SwiftUI

struct PaywallSelection: View {
  @EnvironmentObject private var vm: PaywallViewModel
    var body: some View {
		ForEach(PaymentOptionsEnum.allCases){ payment in
		let selected = vm.selectedOption == payment
		  Button{
			 vm.selectedOption = payment
		  }label: {
			 PaywallSection(payment: payment, best: payment.best, selected: selected)
		  }
		  .buttonStyle(.plain)
		}
		}
}

#Preview {
    PaywallSelection()
	 .environmentObject(PaywallViewModel())
}


@ViewBuilder
func PaywallSection(payment: PaymentOptionsEnum, best: Bool, selected: Bool) -> some View{
  HStack{
	 Image(systemName: selected ? "checkmark.circle.fill" : "circle")
		.font(.title2)
		.foregroundStyle(selected ? .blue : .gray)
	 
	 VStack(alignment: .leading){
		HStack{
		  Text(payment.id)
			 .font(.title3)
		  if best{
			 Text("BEST VALUE")
				.font(.caption)
				.foregroundStyle(.white)
				.padding(2)
				.padding(.horizontal, 5)
				.background(
				  RoundedRectangle(cornerRadius: 5)
					 .fill(.green)
				)
		  }
		}
		.fontWeight(.medium)
		
		Text(payment.desc)
		  .foregroundStyle(.gray)
		  .font(.caption)
	 }
	 .fixedSize()
	 
	 Text(payment.price)
		.font(.headline)
		.frame(maxWidth: .infinity, alignment: .trailing)
  }
  .padding(10)
  .background(
	 RoundedRectangle(cornerRadius: 15)
		.fill(.white)
		.shadow(radius: 2)
  )
}
