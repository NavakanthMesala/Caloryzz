//
//  LoginView.swift
//  Caloryzee
//
//  Created by Nava Kanth on 4/16/23.
//

import SwiftUI
import NavigationStack


struct WelcomePage: View {
    @State private var rotationAngle: Double = 0
    @EnvironmentObject private var navigationStack: NavigationStackCompat
    @AppStorage("isAuthenticated") var isAuthenticated: Bool = false
    var body: some View {
        VStack {
            Spacer()
                Text("Caloryz")
                    .font(.system(size: 30, weight: .regular, design: .default))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.leading)
                Image(systemName: "bicycle").foregroundColor(.black)
                    .padding()
                    .font(.system(size: 80, weight: .regular, design: .default))
                    .rotationEffect(.degrees(rotationAngle))
                    .animation(.easeInOut(duration: 1))
                    .onAppear {
                        withAnimation {
                        rotationAngle += 45 // Rotate the image by 45 degrees on each tap
                                    }
            }
            Spacer()
                Button {
                    self.navigationStack.push(LoginView())
                } label: {
                    Text("Login")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        
                }
                .frame(maxWidth: .infinity)
                .padding()
            Button {
                self.navigationStack.push(SignUpView())
            } label: {
                Text("Sign up")
                    .foregroundColor(.black)
            }
            .frame(maxWidth: .infinity)
            .padding()
            Spacer()
        }.background(.mint)
            .onAppear {
                if isAuthenticated {
                    self.navigationStack.push(HomeView())
                }
            }
    }
}


struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isActive = false
    @ObservedObject private var login = LoginViewModel()
    @EnvironmentObject private var navigationStack: NavigationStackCompat
    @AppStorage("isAuthenticated") var isAuthenticated: Bool = false
var body: some View {
        VStack(spacing: 20) {
            HStack {
                Button {
                    navigationStack.pop(to: .root)
                } label: {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .foregroundColor(.black)
                        .padding()
                }

                Text("Login")
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
            }
            
            Spacer()
            TextField("email", text: $email)
                .font(.title)
                .multilineTextAlignment(.center)
                .padding()
            
            SecureField("Password", text: $password)
                .font(.title)
                .multilineTextAlignment(.center)
                .padding()
            Spacer()
            Button {
                login.login(email: email, password: password) { status in
                    if status {
                        DispatchQueue.main.async {
                            self.isAuthenticated = true
                      self.navigationStack.push(HomeView())
                        }
                    }
                }
            } label: {
                Text("Login")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.black)
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity)
            .padding()
            Button {
                /// Add functionality remove print statement
                print("=> Forgot password clicked")
            } label: {
                Text("Forgot Password")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .padding()
            }

            Spacer()
        }.background(.mint)
    }
}

struct SignUpView: View {
    @State private var email: String = ""
    @AppStorage("profileName") var profileName: String = ""
    @State private var password: String = ""
    @State private var isActive = false
    @ObservedObject private var login = LoginViewModel()
    @EnvironmentObject private var navigationStack: NavigationStackCompat
var body: some View {
        VStack(spacing: 20) {
            HStack {
                Button {
                    navigationStack.pop(to: .root)
                } label: {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .foregroundColor(.black)
                        .padding()
                }

                Text("Sign Up")
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
            }
            
            Spacer()
            TextField("Profile Name", text: $profileName)
                .font(.title)
                .multilineTextAlignment(.center)
                .padding()
            TextField("email", text: $email)
                .font(.title)
                .multilineTextAlignment(.center)
                .padding()
            
            SecureField("Password", text: $password)
                .font(.title)
                .multilineTextAlignment(.center)
                .padding()
            Spacer()
            Button {
                login.signUp(email: email, password: password) { status, err  in
                    if status {
                        DispatchQueue.main.async {
                            self.profileName = profileName
                      self.navigationStack.push(HomeView())
                        }
                    }
                }
            } label: {
                Text("Sign up")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.black)
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity)
            .padding()
            Spacer()
        }.background(.mint)
    }
}
