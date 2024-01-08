//
//  ResultView.swift
//  Quizzify
//
//  Created by Bandit Silachai on 8/1/24.
//

import SwiftUI

struct ResultView: View {
    var body: some View {
        VStack {
            Text("Result")
                .font(.largeTitle.bold())
            NavigationLink {
                HomeView()
            } label: {
                Text("Go Home!")
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    ResultView()
}
