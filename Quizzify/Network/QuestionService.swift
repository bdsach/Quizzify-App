//
//  QuestionService.swift
//  Quizzify
//
//  Created by Bandit Silachai on 4/1/24.
//

import Foundation
import Alamofire

final class QuestionService {
    static let shared = QuestionService()
    
    func submitAnswer(_ parameters: AnswerSheet) {
        print("submitting>>>>>")
        guard let url = URL(string: "https://quizzify-api.fly.dev/answersheet") else { return }
        
        AF.request(url,method: .post, parameters: parameters, encoder: JSONParameterEncoder.default).responseData { response in
            
            switch response.result {
            case .success(let data):
                
                do {
                    guard let bodyObject = try JSONSerialization.jsonObject(with: data) as? [String: Any]  else { return}
                    
                    guard let statusCode = response.response?.statusCode else { return }
                    
                    print(statusCode, bodyObject)
                    
                } catch {
                    
                }
                
            case .failure(let failure):
                print(failure)
            }
            
        }
    }
    
}
