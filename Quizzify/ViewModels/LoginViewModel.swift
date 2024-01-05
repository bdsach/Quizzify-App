//
//  LoginViewModel.swift
//  Quizzify
//
//  Created by Bandit Silachai on 5/1/24.
//

import Foundation

final class LoginViewModel: ObservableObject {
    
    init() {
//        checkCookie()
    }
    
    func login() {
        print("login is tapped!")
        AuthService.shared.login { result in
            switch result {
            case .success(let success):
                print(success)
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
