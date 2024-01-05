//
//  Option.swift
//  Quizzify
//
//  Created by Bandit Silachai on 4/1/24.
//

import SwiftUI

struct OptionButton: View {
    @Binding var selected: String
    @Binding var answerId: String
    var questionIndex: Int
    var questionCount: Int
    var option: Option
    
    
    var body: some View {
        Button(action: {
           
            if selected == option.char {
                selected = ""
                answerId = ""
            } else {
                selected = option.char
                answerId = option.id
            }
            
        }, label: {
           
            Capsule(style: .continuous)
                .fill(option.char == selected ? Color.appColorPrimary.opacity(0.7) : Color.gray.opacity(0.1))
                .frame(maxWidth: .infinity, maxHeight: 60)
                .overlay(
                    HStack(content: {
                        Circle()
                            .fill(option.char == selected ? Color.appColorPrimary : .gray.opacity(0.07))
                            .frame(width: 40, height: 40)
                            .overlay {
                                Text(option.char)
                                    .foregroundStyle(.black)
                                    .font(.subheadline)
                            }
                            .padding(.leading, 8)
                        
                        Text(option.text)
                            .foregroundStyle(.black.opacity(0.9))
                            .fontWeight(.medium)
                    })
                    .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .leading)
                )
        })
    }
}
