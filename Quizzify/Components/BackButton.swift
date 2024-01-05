//
//  BackButton.swift
//  Quizzify
//
//  Created by Bandit Silachai on 4/1/24.
//

import SwiftUI

struct BackButton: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Button(action: {
            dismiss()
        }, label: {
            HStack(content: {
                Image(systemName: "arrow.backward")
                Text("Back")
            })
            .foregroundStyle(.black.opacity(0.8))
            .fontWeight(.medium)
        })
    }
}

#Preview {
    BackButton()
}
