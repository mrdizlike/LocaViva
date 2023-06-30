//
//  RegisterView.swift
//  LocaViva
//
//  Created by Виктор on 28.06.2023.
//

import SwiftUI

struct RegisterView: View {
    @State var email: String
    @State var phoneNumber: String
    @State var password: String
    
    var body: some View {
        NavigationView {
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
                
                Text("Создать аккаунт")
                    .foregroundStyle(Color(red: 0.9, green: 0.98, blue: 0.81))
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                VStack{
                    InputField(text: $email,
                               title: "Почта",
                               placeholder: "address@example.com")
                    .textInputAutocapitalization(.never)
                    .keyboardType(.emailAddress)
                    
                    InputField(text: $phoneNumber,
                               title: "Телефон",
                               placeholder: "(XXX) XXX-XXXX")
                    .keyboardType(.phonePad)
                    .modifier(PhoneNumberFormatter(phoneNumber: $phoneNumber))
                    .padding(.top)
                    
                    InputField(text: $password,
                               title: "Пароль",
                               placeholder: "Введите свой пароль",
                               isSecureField: true)
                    .textInputAutocapitalization(.never)
                    .padding(.top)
                    
                }
                .padding(.horizontal)
                .padding(.top)
                
                RegisterButton(sceneView: AnyView(RegisterSecondView(email: $email, phoneNumber: $phoneNumber, password: $password)))
                    .padding(.top)
                
                NavigationLink(destination: AnyView(LogRegScreenView())) {
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

struct RegisterSecondView: View {
    @Binding var email: String
    @Binding var phoneNumber: String
    @Binding var password: String
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var country: String = "Москва"
    
    let cities = ["Москва", "Санкт-Петербург"]
    
    var body: some View {
        NavigationView {
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
                
                Text("Создать аккаунт")
                    .foregroundStyle(Color(red: 0.9, green: 0.98, blue: 0.81))
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                VStack{
                    InputField(text: $firstName,
                               title: "Имя",
                               placeholder: "Иван")
                    
                    InputField(text: $lastName,
                               title: "Фамилия",
                               placeholder: "Иванов")
                    .padding(.top)
                    
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Место проживания")
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                            .font(.footnote)
                        
                        Picker("Город", selection: $country) {
                            ForEach(cities, id: \.self) { city in
                                Text(city)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.system(size: 14))
                                    .foregroundStyle(.white)
                            }
                        }
                        .frame(width: 360, height: 50, alignment: .leading)
                        .background(Color(red:0.07, green: 0.46, blue: 0.28))
                        .cornerRadius(15)
                        .pickerStyle(.wheel)
                    }
                    .padding(.top)
                    
                }
                .padding(.horizontal)
                .padding(.top)
                
                //Нужно сделать что-нибудь поумнее
                Button {
                    RegisterButton().createUser(email: email, phone: phoneNumber, password: password, firstName: firstName, lastName: lastName, country: country)
                } label: {
                    Text("Регистрация")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(width: 260, height: 65)
                        .background(Color.blue)
                        .cornerRadius(45)
                }
                .padding(.top)
                
                NavigationLink(destination: AnyView(RegisterView(email: email, phoneNumber: phoneNumber, password: password))) {
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
