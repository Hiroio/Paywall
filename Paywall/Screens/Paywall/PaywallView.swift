//
//  PaywallView.swift
//  Paywall
//
//  Created by user on 27.04.2026.
//

import SwiftUI

struct PaywallView: View {
  @StateObject private var vm = PaywallViewModel()
  var body: some View {
	 VStack{
		
		Image("Header")
		  .scaledToFit()
		
		VStack(spacing: 15){
		  GeneralInfo
		  FeaturesCars
		  //			 MARK: -Selection
		  VStack(spacing: 15){
			 PaywallSelection()
				.environmentObject(vm)
			 
			 //			 MARK: -CONFIRMATION
			 VStack{
				Button{
				  vm.proccesConfirmation()
				}label: {
				  Group{
					 if vm.loading{
						ProgressView()
						  .foregroundStyle(.white)
					 }else{
						Text(vm.isPremium ? "Already active" : vm.selectedOption.btnText)
					 }
				  }
				  .font(.title3.bold())
				  .customBtn()
				}
				
				//			 CAPTION FOR BTN
				Text("Auto-renews at the price above until canceled in Settings\nCancel at least 24h before renewal.")
				  .font(.caption)
				  .foregroundStyle(.gray)
				  .multilineTextAlignment(.center)
				  .fixedSize()
			 }
		  }
		  .disabled(vm.isPremium)
		  .opacity(vm.isPremium ? 0.6 : 1)
		  //			MARK: -LINKS
		  
		}
		.padding()
		.safeAreaInset(edge: .bottom) {
		  PaywallLinks()
			 .environmentObject(vm)
			 .padding()
		}
	 }
	 .ignoresSafeArea(edges: .top)
	 .overlay(
		Button{
		  //			 TODO: Navigation
		}label: {
		  Image(systemName: "xmark")
			 .padding(10)
			 .foregroundStyle(.white)
			 .background(
				Circle()
				  .fill(.black.opacity(0.3))
			 )
		}
		  .padding(),
		alignment: .topTrailing
	 )
//	 MARK: SHEET FOR LINKS
	 .sheet(isPresented: Binding<Bool>(
		get: {
		  vm.showSheet != nil
		},
		set: { _ in
		  vm.showSheet = nil
		})){
		  InfoSheet(link: vm.showSheet)
		}
//	 MARK: ALERT
		.alert("Something went wrong..", isPresented: Binding<Bool>(
		  get: {
				vm.error != nil
			 },
			 set: { _ in
				vm.error = nil
			 }), actions: {
		  Button("Close", role: .destructive, action: {})
		})
		.animation(.easeInOut, value: vm.selectedOption)
	 
  }
  
  
  
  
  private var GeneralInfo: some View{
	 VStack(){
		VStack{
		  Text("Premium Bricks")
			 .font(.title.bold())
		  Text("A curated crate of LEGO pieces, delivered to your door every month.")
			 .foregroundStyle(.gray)
		}
	 }
	 .multilineTextAlignment(.center)
  }
  
  private var FeaturesCars: some View{
	 VStack(alignment: .leading){
		FeuturesComponent(icon: "batteryblock", title: "500+ curated pieces", desc: "Hand-picked for each build set")
		FeuturesComponent(icon: "truck.box", title: "Free shipping, monthly", desc: "New crate at your door every month")
		FeuturesComponent(icon: "book.closed", title: "Exclusive build guides", desc: "Step-by-step in the companion app")
		FeuturesComponent(icon: "checkmark", title: "Cancel anytime", desc: "No questions, no fees")
	 }
	 .padding(.vertical)
  }
}


#Preview {
    PaywallView()
}


@ViewBuilder
func FeuturesComponent(icon: String, title: String, desc: String) -> some View{
  HStack{
	 Image(systemName: icon)
		.iconBadge()
	 VStack(alignment: .leading){
		Text(title)
		  .font(.headline)
		
		Text(desc)
		  .foregroundStyle(.gray)
	 }
  }
}
