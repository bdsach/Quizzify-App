//
//  QuestionViewModel.swift
//  Quizzify
//
//  Created by Bandit Silachai on 4/1/24.
//

import Foundation

final class QuestionViewModel: ObservableObject {
    @Published var questions: [Question]?
    @Published var qIndex: Int = 0
    @Published var questionsIsLoading = false
    @Published var selected = ""
    @Published var answerId = ""
    @Published var emptyQuestion = false
    
    init() {
        questionsIsLoading = true
        emptyQuestion = true
    }
    
    func getQuestions(currentQuizId id: String) {
        QuizService.shared.questionInQuiz(id: id) { result in
            switch result {
            case .success(let data):

                if data.isEmpty {
                    self.emptyQuestion = true
                } else {
                    self.emptyQuestion = false
                    self.questions = data
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                    self.questionsIsLoading = false
                })
            case .failure(let failure):
                print(failure)
                self.questionsIsLoading = false
            }
        }
    }
    
    func submitAnswer(_ answer: AnswerSheet) {
        QuestionService.shared.submitAnswer(answer)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            self.nextQuestion()
            self.selected = ""
            self.answerId = ""
        })
    }
    
    func prevQuestion() {
        self.qIndex -= 1
    }
    
    func nextQuestion() {
        if let questions = questions {
            if qIndex < questions.count - 1 {
                self.qIndex += 1
            } else {
                qIndex = 0
            }
        }
    }
}
