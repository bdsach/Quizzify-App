//
//  CategoryItem.swift
//  Quizzify
//
//  Created by Bandit Silachai on 4/1/24.
//

import SwiftUI

struct CategoryItem: View {
    var text: String = ""
    var iconUrl: String = ""

    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.white)
            .shadow(color: .gray.opacity(0.1), radius: 5)
            .frame(height: 150)
            .overlay {
                VStack(content: {
                    AsyncImage(url: URL(string: iconUrl)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 55, height: 55, alignment: .center)
                    Text(text)
                        .foregroundStyle(.black.opacity(0.8))
                        .fontWeight(.semibold)
                })
            }
    }
}

#Preview {
    CategoryItem()
}
