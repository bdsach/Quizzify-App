//
//  Question.swift
//  Quizzify
//
//  Created by Bandit Silachai on 4/1/24.
//

import Foundation


struct Question: Codable {
    let id, quizID, quizText, questionText: String
    let options: [Option]
    
    enum CodingKeys: String, CodingKey {
        case id
        case quizID = "quiz_id"
        case quizText = "quiz_text"
        case questionText = "question_text"
        case options
    }
}

struct Option: Codable {
    let id, text, char: String
    let isCorrect: Bool
    
    enum CodingKeys: String, CodingKey {
        case id, text
        case isCorrect = "is_correct"
        case char = "option"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(String.self, forKey: .id)
        self.text = try container.decode(String.self, forKey: .text)
        self.char = try container.decode(String.self, forKey: .char)
        
        if let isCorrectValue = try? container.decode(Int.self, forKey: .isCorrect), isCorrectValue == 1 {
            isCorrect = true
        } else {
            isCorrect = false
        }
    }
}
 

struct AnswerSheet: Codable {
    let questionId: String
    let answerId: String
    let userId: String
    
    enum CodingKeys: String, CodingKey {
        case questionId = "question_id"
        case answerId = "answer_id"
        case userId = "user_id"
    }
    
    init(questionId: String, answerId: String, userId: String) {
        self.questionId = questionId
        self.answerId = answerId
        self.userId = userId
    }
}

struct AnswerSheetResultRequest: Codable {
    let quidId: String
    let userId: Int
    
    enum CodingKeys: String, CodingKey {
        case quidId = "quiz_id"
        case userId = "user_id"
        
    }
}


struct AnswerSheetResultReponse: Codable {
    let total: Int
    let correct: Int
}
