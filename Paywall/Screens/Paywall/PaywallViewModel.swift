//
//  PaywallViewModel.swift
//  Paywall
//
//  Created by user on 27.04.2026.
//

import Foundation
import Combine

// Також по правильному завантажити продукти спочатку усі
// і якраз обробити Product(storekit) там будуть і ціни і одразу продукти для purchase


@MainActor
class PaywallViewModel: ObservableObject{
  @Published var selectedOption: PaymentOptionsEnum = .yearly
  
  @Published var loading: Bool = false
  @Published var showSheet: LinksEnum? = nil
  @Published var error: Error? = nil
  
  private let storeActor = StoreActor()
  init(){
	 loadInitialStatus()
  }
  
  func proccesConfirmation(){
	 loading = true
	 Task{
		defer { loading = false}
		do{
		  switch selectedOption {
		  case .yearly:
			 try await YearlySubscription()
		  case .monthly:
			 try await MonthlySubcription()
		  }
		}
		catch{
		  print(error)
		  self.error = error
		}
	 }
  }
  
  func proccesLinkPress(_ link: LinksEnum){
	 switch link {
	 case .restore:
		restorePurchase()
	 case .terms:
		self.showSheet = .terms
	 case .privacy:
		self.showSheet = .privacy
	 }
  }
  
  private func MonthlySubcription() async throws{
	 try await storeActor.purchase("month_qwerty.com")
  }
  
  
  private func YearlySubscription() async throws{
	 try await storeActor.purchase("year_qwerty.com")
  }
  
  private func restorePurchase(){
	 loading = true
	 Task{
		defer{ loading = false }
		do{
		  try await storeActor.restore()
		}catch{
		  print(error)
		  self.error = error
		}
	 }
  }
  
  func loadInitialStatus() {
	 loading = true
	 Task {
		defer {loading = false}
		await storeActor.checkInitialStatus()
	 }
  }
  
}


extension PaywallViewModel{
  var isPremium: Bool{
	 UserDefaults.standard.bool(forKey: "isPremium")
  }
}
