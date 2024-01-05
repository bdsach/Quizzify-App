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
    
    init() {
        AuthService.shared.profile { result in
            switch result {
            case .success(let data):
                self.profile = data
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
}
