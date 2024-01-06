//
//  LoginViewModel.swift
//  Quizzify
//
//  Created by Bandit Silachai on 5/1/24.
//

import Foundation

final class LoginViewModel: ObservableObject {
    
    @Published var isLogged = false
    @Published var isBusy = true
    
    init() {
        checkCookie { logged in
            if logged {
                self.isLogged = true
                self.isBusy = false
            } else {
                self.isBusy = false
                self.isLogged = false
                
            }
        }
    }
    
    func login() {
        print("login is tapped!")
        AuthService.shared.login { result in
            switch result {
            case .success(let success):
                print(success)
                self.isLogged = true
                self.isBusy = false
            case .failure(let failure):
                print(failure)
                self.isLogged = false
                self.isBusy = false
            }
        }
    }
}
