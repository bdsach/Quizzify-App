//
//  LoginServer.swift
//  Quizzify
//
//  Created by Bandit Silachai on 5/1/24.
//

import Foundation
import Alamofire

enum LoginError: Error {
    case invalidCredentials
    case networkError
}

final class AuthService {
    static let shared = AuthService()
    
    func login(completion: @escaping(Result<String, Error>) -> Void) {
        guard let url = URL(string: "https://quizzify-api.fly.dev/login") else { return }
        
        let parameter = UserLogin(email: "user@email.com", password: "1234")
        
        AF.request(url, method: .post, parameters: parameter, encoder: JSONParameterEncoder.default).responseData { response in
            switch response.result {
            case .success(let data):
                print(data)
                completion(.success("Login is success"))
            case .failure(let failure):
                print("error on auth")
                print(failure)
                completion(.failure(failure))
            }
        }
    }
    
    func logout() {
        guard let logoutURL = URL(string: "https://book-crud-api.fly.dev/logout") else {
            return
        }

        AF.request(logoutURL).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    guard let bodyObject = try JSONSerialization.jsonObject(with: data) as? [String:Any] else {return}
                    print(bodyObject)
                } catch {
                    
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func profile(completion: @escaping(Result<Profile, Error>) -> Void) {
        guard let profileURL = URL(string: "https://quizzify-api.fly.dev/profile") else {
            return
        }

        AF.request(profileURL).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    guard let bodyObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else { return}
                    guard let bodyData = bodyObject["data"] else { return }
                    
                    let profileObject = try JSONSerialization.data(withJSONObject: bodyData)
                    let profileData = try JSONDecoder().decode([Profile].self, from: profileObject)[0]
                    print("from service", profileData)
                    completion(.success(profileData))
                    
                } catch let error {
                    completion(.failure(error))
                }
                
            case .failure(let failure):
                print(failure)
                completion(.failure(failure))
            }
        }
    }
}
