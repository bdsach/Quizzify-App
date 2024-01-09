//
//  ResultView.swift
//  Quizzify
//
//  Created by Bandit Silachai on 8/1/24.
//

import SwiftUI

struct ResultView: View {
    @ObservedObject private var vm = ResultViewModel()
    var body: some View {
        if vm.isBusy {
            ProgressView()
                .controlSize(.large)
        } else {
            Content
                .navigationBarBackButtonHidden()
        }
    }
    
    var Content: some View {
        VStack(spacing: 20) {
            Text("Result")
                .font(.largeTitle.bold())
                .foregroundStyle(.black.opacity(0.8))
            HStack {
                if let result = vm.result {
                    Text("\(result.correct) / \(result.total)")
                        .font(.system(size: 72))
                }
            }
            .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, minHeight: 0, idealHeight: 100, maxHeight: 200, alignment: .center)
            .background(Color.appColorPrimary.opacity(0.1))
            .foregroundStyle(Color.appColorPrimary.opacity(1))
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .padding()
            
            NavigationLink {
                HomeView()
            } label: {
                HStack(content: {
                    HomeButton
                })
            }
        }
    }
    
    var HomeButton: some View {
        Capsule()
            .foregroundColor(.black.opacity(0.6))
            .frame(width: 130, height: 60)
            .overlay(
                Capsule()
                    .foregroundColor(Color.appColorBackground)
                    .frame(width: 125, height: 55)
                    .overlay(
                        VStack {
                            Text("Home")
                                .font(.title3)
                                .fontWeight(.medium)
                                .foregroundStyle(.black.opacity(0.7))
                        }
                    )
            )
    }
}

#Preview {
    ResultView()
        .environmentObject(ResultViewModel())
}
