//
//  LoginFlowViewModel.swift
//  Quizzify
//
//  Created by Bandit Silachai on 5/1/24.
//

import Foundation

final class LoginFlowViewModel: ObservableObject {
    
    @Published var isLogged = false
    
    init() {
        checkCookie { logged in
            if logged {
                self.isLogged = true
            } else {
                self.isLogged = false
            }
        }
        
    }
}
