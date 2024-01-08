//
//  ProfileViewModel.swift
//  Quizzify
//
//  Created by Bandit Silachai on 5/1/24.
//

import Foundation

final class ProfileViewModel: ObservableObject {
    @Published var name = "Bandit Silachai"
    @Published var email = "test@email.com"
    @Published var profile: Profile?
    @Published var isBusy = false
    @Published var isLogged = false
    
    init() {
        isBusy = true
        AuthService.shared.profile { result in
            switch result {
            case .success(let data):
                self.profile = data
                self.isBusy = false
                self.isLogged = true
            case .failure(let failure):
                print(failure)
                self.isBusy = false
                self.isLogged = false
            }
        }
    }
    
    func logout() {
        isBusy = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            AuthService.shared.logout { result in
                switch result {
                case .success:
                    self.isBusy = false
                    self.isLogged = false
                case .failure:
                    self.isLogged = true
                    self.isBusy = true
                }
            }
            
        })
    }
    
}
