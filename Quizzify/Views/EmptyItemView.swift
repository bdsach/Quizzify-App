//
//  EmptyItemView.swift
//  Quizzify
//
//  Created by Bandit Silachai on 4/1/24.
//

import SwiftUI

struct EmptyItemView: View {
    var body: some View {
        VStack {
            Image(systemName: "tray.fill")
                .foregroundStyle(.gray)
                .font(.system(size: 48))
            Text("No Item")
                .font(.title2.bold())
            Text("There are currently no items to display.")
                .font(.subheadline)
                .foregroundStyle(.gray)
            
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
    EmptyItemView()
}
