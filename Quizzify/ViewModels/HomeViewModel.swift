//
//  HomeViewModel.swift
//  Quizzify
//
//  Created by Bandit Silachai on 4/1/24.
//

import Foundation

final class HomeViewModel: ObservableObject {
    @Published var sayHello = "Hi Bandit! 👋"
    @Published var welcomeMessage = "Are you up for a quiz adventure?\nLet's see what you've got!"
    @Published var avatarUrl = URL(string: "https://avatarfiles.alphacoders.com/138/138946.jpg")
    @Published var categories: [Categories] = []
    @Published var categoriesIsLoading = false
    @Published var isLogged = false
    
    init() {
        self.categoriesIsLoading = true
        checkCookie { logged in
            if logged {
                self.isLogged = true
                self.loadCategories()
            } else {
                self.isLogged = false
            }
        }
    }
    
    func loadCategories() {
        QuizService.shared.categories { result in
            switch result {
            case .success(let data):
                self.categories = data
                DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                    self.categoriesIsLoading = false
                })
            case .failure(let error):
                print(error)
                self.categoriesIsLoading = false
            }
           
        }
    }
}
