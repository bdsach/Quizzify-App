//
//  LoginView.swift
//  Quizzify
//
//  Created by Bandit Silachai on 5/1/24.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject private var vm = LoginViewModel()
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        VStack {
            if vm.isBusy {
                 ProgressView()
                    .controlSize(.large)
            } else {
                if vm.isLogged {
                    HomeView()
                } else {
                    Content
                }
            }
        }
        .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, minHeight: 0, idealHeight: 100, maxHeight: .infinity, alignment: .center)
        .background(Color.appColorBackground)
        .navigationBarBackButtonHidden()
    }
    
    var Logo: some View {
       
        HStack(alignment: .center, spacing: 12) {
            Image(systemName: "q.square.fill")
                .font(.system(size: 40))
                .frame(width: 60, height: 60, alignment: .center)
                .background(Color.appColorPrimary)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            VStack(alignment: .center, spacing: 0) {
                Text("Quizzify")
                    .font(.system(size: 48).weight(.bold))
                    .foregroundStyle(.black.opacity(0.8))
            }
        }
    }
    
    var FormLogin: some View {
        VStack(alignment: .leading, spacing: 10) {
            VStack(alignment: .leading, spacing: 5, content: {
                Text("Email")
                TextField("", text: $email)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
                    .padding(.horizontal, 10)
                    .background(.gray.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 4, style: .continuous))
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .keyboardType(.emailAddress)
            })

            VStack(alignment: .leading, spacing: 5) {
                Text("Password")
                SecureField("", text: $password)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
                    .padding(.horizontal, 10)
                    .background(.gray.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 4, style: .continuous))
                    .keyboardType(.default)
            }
            
        }
        .padding(.horizontal)
    }
    
    var SubmitButton: some View {
        Button(action: {
            vm.login(UserLogin(email: email, password: password))
            
        }, label: {
            Text("Login")
                .font(.title3.bold())
        })
        .buttonStyle(.borderedProminent)
        .tint(Color.appColorPrimary)
        .controlSize(.large)
        .disabled(email.isEmpty || password.isEmpty)
    }
    
    var Content: some View {
        VStack(spacing: 40, content: {
            Logo
            FormLogin
            SubmitButton
        })
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    LoginView()
}
