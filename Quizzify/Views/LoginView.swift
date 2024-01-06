//
//  LoginView.swift
//  Quizzify
//
//  Created by Bandit Silachai on 5/1/24.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject private var vm = LoginViewModel()

    var body: some View {
        if vm.isBusy {
             ProgressView()
        } else {
            if vm.isLogged {
                HomeView()
            } else {
                Content
            }
        }
    }
    
    var Content: some View {
        VStack(content: {
            Text("LoginView!")
            Button(action: {
                vm.login()
            }, label: {
                Text("Logint")
            })
        })
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    LoginView()
}
