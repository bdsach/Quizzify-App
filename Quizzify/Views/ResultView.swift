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
            
            HStack {
                if let result = vm.result {
                    Text("\(result.correct) / \(result.total)")
                        .font(.system(size: 50))
                }
            }
            .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, minHeight: 0, idealHeight: 100, maxHeight: 200, alignment: .center)
            .background(Color.gray.opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .padding()
            
            NavigationLink {
                HomeView()
            } label: {
                HStack(content: {
                    Text("Go Home")
                        .font(.title3)
                        .fontWeight(.medium)
                })
                .frame(width: 120, height: 50)
                .background(Color.appColorPrimary)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            }
        }
    }
}

#Preview {
    ResultView()
}
