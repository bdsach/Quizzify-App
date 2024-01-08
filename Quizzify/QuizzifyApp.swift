//
//  QuizzifyApp.swift
//  Quizzify
//
//  Created by Bandit Silachai on 4/1/24.
//

import SwiftUI

@main
struct QuizzifyApp: App {
    var body: some Scene {
        WindowGroup {
            LoginFlowView()
        }
    }
}


func checkCookie(completion: @escaping(Bool)-> Void) {
    DispatchQueue.main.async {
        let cookies = HTTPCookieStorage.shared
        
        print(cookies)
        if let cookies = HTTPCookieStorage.shared.cookies {
            print("All Cookies: from APP")
            
            if cookies.isEmpty {
                completion(false)
            }

            for cookie in cookies {
                print("Name: \(cookie.name)")
                print("Value: \(cookie.value)")
                print("Domain: \(cookie.domain)")
                print("Path: \(cookie.path)")
                print("Expires: \(cookie.expiresDate!)")
                print("Secure: \(cookie.isSecure)")
                print("HttpOnly: \(cookie.isHTTPOnly)")
                print("----------")
                
                if !cookie.name.isEmpty && cookie.name == "token" {
                    completion(true)
                } else {
                    completion(false)
                }
            }
        }
    }
}
