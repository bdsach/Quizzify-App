//
//  ResultViewModel.swift
//  Quizzify
//
//  Created by Bandit Silachai on 8/1/24.
//

import Foundation

class ResultViewModel: ObservableObject {
    @Published var isBusy = true
    @Published var result: AnswerSheetResultReponse?
    
    init() {
        getResult()
    }
    
    func getResult() {
        QuestionService.shared.result(quizId: "01HK7GE2PK3SNFGG1VD6GXG05Q", userId: 1) { result in
            switch result {
            case .success(let data):
                self.result = data.first
                self.isBusy = false
            case .failure(let failure):
                print(failure)
                self.isBusy = false
            }
        }
    }
}
