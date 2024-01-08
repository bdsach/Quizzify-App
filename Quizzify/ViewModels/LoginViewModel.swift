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
                print("logged")
                self.isLogged = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                    self.isBusy = false
                })
            } else {
                print("not logged")
                self.isLogged = false
                DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                    self.isBusy = false
                })
            }
        }
    }
    
    func login(_ user: UserLogin) {
        print("login for \(user)")
        self.isBusy = true
        AuthService.shared.login(user: user) { result in
            switch result {
            case .success(let success):
                print(success)
                self.isLogged = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                    self.isBusy = false
                })
            case .failure(let failure):
                print(failure)
                self.isLogged = false
                DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                    self.isBusy = false
                })
            }
        }
    }
}
