//
//  AboutAppView.swift
//  Quizzify
//
//  Created by Bandit Silachai on 4/1/24.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject private var vm = ProfileViewModel()

    var body: some View {
        List {
            Section("Account") {
                VStack(content: {
                    HStack(content: {
                        Circle()
                            .fill(.gray.opacity(0.5))
                            .frame(width: 50, height: 50)
                        VStack(alignment: .leading, spacing: 0 ,content: {
                            Text("\(vm.profile?.firstName ?? "(not set)") \(vm.profile?.lastName ?? "")")
                                .foregroundStyle(.black.opacity(0.8))
                            Text("\(vm.profile?.email ?? "")")
                                .foregroundStyle(.gray)
                        })
                    })
                })
            }
            
            Section("App Version") {
                Text("1.0.0")
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BackButton()
            }
        }
        
    }
}

#Preview {
    ProfileView()
}
