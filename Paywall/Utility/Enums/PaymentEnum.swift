//
//  PaymentEnum.swift
//  Paywall
//
//  Created by user on 27.04.2026.
//

import Foundation


enum PaymentOptionsEnum: String, CaseIterable, Identifiable{
  case yearly, monthly
  
  var id: String{ self.rawValue.capitalized}
  
  var price: String{
	 switch self {
	 case .yearly:
		"$129.99"
	 case .monthly:
		"$14.99"
	 }
  }
  
  var desc: String{
	 switch self {
	 case .yearly:
		"$10.83 / month | Save 30%"
	 case .monthly:
		"7-day free trial, then billed monthly"
	 }
  }
  
  var best: Bool{
	 switch self {
	 case .yearly:
		true
	 case .monthly:
		false
	 }
  }
  
  var btnText: String{
	 switch self {
	 case .yearly:
		"Continue"
	 case .monthly:
		"Start Free Trial"
	 }
  }
  
  
  static func get(_ id: String) -> PaymentOptionsEnum{
	 if id == "com.qwerty.monthly"{
		return .monthly
	 }else{
		return .yearly
	 }
  }
}
