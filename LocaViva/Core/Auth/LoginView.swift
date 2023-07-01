//
//  LoginView.swift
//  LocaViva
//
//  Created by Виктор on 28.06.2023.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var email = ""
    @State private var password = ""
    @State private var isLoginned = false
    
    var body: some View {
        NavigationStack {
            Color(red: 0.24, green: 0.64, blue: 0.36)
                .ignoresSafeArea()
                .overlay(
            VStack {
                ZStack {
                    Circle()
                        .foregroundStyle(.clear)
                        .frame(width: 512, height: 512)
                        .background(Image("Background")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 512, height: 512)
                            .clipped())
                    Circle()
                        .foregroundStyle(.clear)
                        .frame(width: 275, height: 250)
                        .background(Image("Logo")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 275, height: 250)
                            .clipped())
                        .padding(.top, 200)
                }
                .padding(.top, -300)
                
                Text("Войти в аккаунт")
                    .foregroundStyle(Color(red: 0.9, green: 0.98, blue: 0.81))
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                VStack{
                    InputField(text: $email,
                               title: "Почта или телефон",
                               placeholder: "address@example.com")
                    .textInputAutocapitalization(.never)
                    .keyboardType(.emailAddress)
                    
                    InputField(text: $password,
                               title: "Пароль",
                               placeholder: "Введите свой пароль",
                               isSecureField: true)
                    .textInputAutocapitalization(.never)
                    .padding(.top)
                    
                }
                .padding(.horizontal)
                .padding(.top)

                Button{
                    LoginButton().loginUser(email: email, password: password)
                    isLoginned = true
                } label: {
                    Text("Вход")
                        .font(.headline)
                        .foregroundStyle(.black)
                        .frame(width: 260, height: 65)
                        .background(Color(red: 1, green: 0.81, blue: 0.33))
                        .cornerRadius(45)
                }
                .navigationDestination(isPresented: $isLoginned) {
                    ProfileView()
                }
                .navigationBarBackButtonHidden(true)
                .padding(.top)
                
                Button{
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Назад")
                        .font(.system(size: 20))
                        .foregroundStyle(.white)
                        .opacity(0.6)
                }
                
            })
        }
        .navigationBarBackButtonHidden(true)
    }
}
