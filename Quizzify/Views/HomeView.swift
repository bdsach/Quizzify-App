//
//  ContentView.swift
//  Quizzify
//
//  Created by Bandit Silachai on 4/1/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var vm = HomeViewModel()
    
    let columns = [GridItem(.adaptive(minimum: 150), spacing: 10)] 

    var body: some View {
        NavigationView {
            if vm.categoriesIsLoading {
                ProgressView()
                    .controlSize(.large)
            } else {
                ScrollView {
                    Topbar
                    HeaderDetail
                    QuizCategories
                }
                .background(Color.appColorBackground)
            }
        }
    }
    
    var Topbar: some View {
        HStack(content: {
            Circle()
                .fill(.clear)
                .overlay {
                    AsyncImage(url: vm.avatarUrl) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                }
                .clipShape(Circle())
                .shadow(color: .black.opacity(0.1), radius: 5, x: 3, y: 0)
                .frame(width: 60, height: 60)
            Spacer()
            NavigationLink {
                ProfileView()
            } label: {
                Image(systemName: "line.3.horizontal")
                    .font(.title)
                    .foregroundStyle(.black.opacity(0.7))
            }


        })
        .frame(minWidth: 0,  maxWidth: .infinity)
        .padding()
    }
    
    var HeaderDetail: some View {
        VStack(alignment: .leading,spacing: 14, content: {
            Text("\(vm.sayHello)")
                .font(.title).bold()
            Text("\(vm.welcomeMessage)")
                .fontWeight(.light)
        })
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
    }
    
    var QuizCategories: some View {
        LazyVGrid(columns: columns, spacing: 10, content: {
            ForEach(vm.categories, id: \.id) { item in
                NavigationLink {
                    QuestionView(quizId: item.id)
                } label: {
                    CategoryItem(text: item.text, iconUrl: item.icon)
                }
            }
        })
        .padding()
    }
}

#Preview {
    HomeView()
}
