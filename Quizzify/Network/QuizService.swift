//
//  NetworkService.swift
//  Quizzify
//
//  Created by Bandit Silachai on 4/1/24.
//

import Foundation
import Alamofire

final class QuizService {
    static let shared = QuizService()
    
    func categories(completion: @escaping(Result<[Categories], Error>) -> Void) {
        guard let url = URL(string: "https://quizzify-api.fly.dev/quiz/categories") else { return }
        
        AF.request(url, encoding: JSONEncoding.default).responseData { response in
            
            switch response.result {
            case .success(let data):
              
                do {
                    guard let bodyObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else { return}
                    guard let categoriesData = bodyObject["data"] else { return }
                  
                    let categoriesObject = try JSONSerialization.data(withJSONObject: categoriesData)
                    
                    let categories = try JSONDecoder().decode([Categories].self, from: categoriesObject)
                    
                    completion(.success(categories))
                } catch {
                    
                }
                
                
            case .failure(let failure):
                completion(.failure(failure))
                print(failure)
            }
            
        }
    }
    
    func questionInQuiz(id: String, completion: @escaping(Result<[Question], Error>) -> Void) {
        guard let url = URL(string: "https://quizzify-api.fly.dev/quiz/\(id)") else { return }
        
        AF.request(url, encoding: JSONEncoding.default).responseData { response in
            
            switch response.result {
            case .success(let data):
                do {
                    guard let bodyObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else { return}
                    
                    guard let bodyData = bodyObject["data"] else { return }
                    
                    let questionObject = try JSONSerialization.data(withJSONObject: bodyData)
                    
                    let questionData = try JSONDecoder().decode([Question].self, from: questionObject)
                    
                    completion(.success(questionData))
                } catch {
                    
                }
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
    }
}
