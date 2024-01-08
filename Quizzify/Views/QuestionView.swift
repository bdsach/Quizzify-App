//
//  Question.swift
//  Quizzify
//
//  Created by Bandit Silachai on 4/1/24.
//

import SwiftUI

struct QuestionView: View {
    @StateObject private var vm = QuestionViewModel()
    var quizId = ""
    
    var body: some View {
        VStack(content: {
            if !vm.questionsIsLoading && vm.emptyQuestion {
                EmptyItemView()
            } else {
                if vm.showResult {
                   ResultView()
                } else {
                    QuestionContent
                }
            }
            
            if vm.questionsIsLoading {
                VStack {
                    ProgressView()
                        .controlSize(.large)
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            }
            
        })
        .background(.appColorBackground)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BackButton()
            }
        }
        .onAppear {
            vm.getQuestions(currentQuizId: quizId)
        }
    }
    
    var QuestionContent: some View {
        VStack(content: {
            if let questions = vm.questions , !vm.questionsIsLoading, !vm.emptyQuestion {
                VStack(alignment: .leading) {
                    Text("Question \(vm.qIndex + 1) of \(questions.count)")
                        .foregroundStyle(.black.opacity(0.5))
                        .fontWeight(.semibold)
                        .font(.headline)
                    
                    ProgressView(value: 1, total: Double(5))
                        .progressViewStyle(.linear)
                        .tint(.appColorPrimary)
                    
                    Text(questions[vm.qIndex].questionText)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(3)
                    
                    Rectangle()
                        .fill(.clear)
                        .frame(maxWidth: .infinity, maxHeight: 150)
                        .overlay {
                            Image("workout")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding()
                        }
                    ForEach(questions[vm.qIndex].options, id: \.id) { option in
                        OptionButton(selected: $vm.selected, answerId: $vm.answerId, questionIndex: vm.qIndex, questionCount: questions.count, option: option)
                    }
                    
                    Spacer()
                    VStack(alignment: .center, spacing: nil, content: {
                        Button(action: {
                            withAnimation(.snappy) {
                                if let questions = vm.questions {
                                    vm.submitAnswer(AnswerSheet(questionId: questions[vm.qIndex].id, answerId: vm.answerId, userId: "1"))
                                }
                            }
                        }, label: {
                            Text("Submit Answer")
                        })
                        .controlSize(.large)
                        .clipShape(Capsule())
                        .tint(Color.appColorPrimary)
                        .buttonStyle(.borderedProminent)
                        .disabled(vm.selected.isEmpty)
                    })
                    .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, minHeight: 0, idealHeight: 100, maxHeight: .infinity, alignment: .center)
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding()
                .animation(.default, value: vm.qIndex)
                Spacer()
            }
        })
    }
}

#Preview {
    QuestionView()
}
