//
//  LoginViewModel.swift
//  Caloryzee
//
//  Created by Nava Kanth on 4/16/23.
//

import Foundation
import Firebase
import SwiftUI

class LoginViewModel: ObservableObject {
    func login(email: String, password: String, completion: @escaping (Bool) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if (authResult != nil) {
                completion(true)
            }
            else {
                completion(false)
            }
        }
    }
    
    func signUp(email: String, password: String, completion: @escaping (Bool, Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                // Handle the error here.
                completion(false, error)
                return
            }
            
            // Sign up was successful.
            completion(true, nil)
        }
    }
}
