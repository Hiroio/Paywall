//
//  StoreManager.swift
//  Paywall
//
//  Created by user on 27.04.2026.
//

import Foundation

actor StoreActor {
  
  func checkInitialStatus() async {
	 try? await Task.sleep(nanoseconds: 500_000_000)
  }
  
  
  func purchase(_ product: String) async throws{
	 try await Task.sleep(nanoseconds: 2_000_000_000)
  }
  
  func restore() async throws {
	 try await Task.sleep(nanoseconds: 2_000_000_000)
  }
}
