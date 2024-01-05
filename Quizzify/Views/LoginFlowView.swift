//
//  LoginFlowView.swift
//  Quizzify
//
//  Created by Bandit Silachai on 5/1/24.
//

import SwiftUI

struct LoginFlowView: View {
    @ObservedObject private var vm = LoginFlowViewModel()
    var body: some View {
        if vm.isLogged {
            HomeView()
        } else {
            LoginView()
        }
    }
}

#Preview {
    LoginFlowView()
}
