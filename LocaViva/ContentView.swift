//
//  ContentView.swift
//  LocaViva
//
//  Created by Виктор on 27.06.2023.
//

import SwiftUI

struct BeginScreenView: View {

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
                
                Text("Привет!")
                    .foregroundStyle(Color(red: 0.9, green: 0.98, blue: 0.81))
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                Text("Посмотрите на новые горизонты и откройте для себя свой город с новой перспективы. LocaViva поможет вам находить уникальные места, интересные события и вдохновляющие приключения, которые скрываются прямо у вас под носом")
                    .foregroundStyle(Color(red: 0.9, green: 0.98, blue: 0.81))
                    .font(.headline)
                    .minimumScaleFactor(0.5)
                    .multilineTextAlignment(.center)
                    .padding()
                
                NextButton(sceneView: AnyView(RecomendationScreenView()))
                
            })
        }
    }
}

struct RecomendationScreenView: View {

    var body: some View {
        NavigationView {
            Color(red: 0.24, green: 0.64, blue: 0.36)
                .ignoresSafeArea()
                .overlay(
            VStack {
                ZStack {
                    Rectangle()
                        .foregroundStyle(.clear)
                        .frame(width: 512, height: 512)
                        .background(Image("Background2")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 512, height: 512)
                            .clipped())
                }
                .padding(.top, -200)
                
                Text("Рекомендации")
                    .foregroundStyle(Color(red: 0.9, green: 0.98, blue: 0.81))
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("LocaViva  предоставляет кураторские рекомендации и рейтинги для различных мест и мероприятий. Ты можешь найти самые популярные места, скрытые жемчужины и необычные места, которые стоит посетить")
                    .foregroundStyle(Color(red: 0.9, green: 0.98, blue: 0.81))
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.5)
                    .padding()
                
                NextButton(sceneView: AnyView(MapScreenView()))
                
            })
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct MapScreenView: View {

    var body: some View {
        NavigationView {
            Color(red: 0.24, green: 0.64, blue: 0.36)
                .ignoresSafeArea()
                .overlay(
            VStack {
                ZStack {
                    Rectangle()
                        .foregroundStyle(.clear)
                        .frame(width: 512, height: 512)
                        .background(Image("Background3")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 512, height: 512)
                            .clipped())
                }
                .padding(.top, -200)
                
                Text("Интерактивная карта")
                    .foregroundStyle(Color(red: 0.9, green: 0.98, blue: 0.81))
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Ты можешь легко найти ближайшие интересные места и получить информацию о них, включая адрес, часы работы, оценки и отзывы других пользователей")
                    .foregroundStyle(Color(red: 0.9, green: 0.98, blue: 0.81))
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.5)
                    .padding()
                
                NextButton(sceneView: AnyView(LogRegScreenView()))
            })
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct LogRegScreenView: View {

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
                
                Text("И это не все...")
                    .foregroundStyle(Color(red: 0.9, green: 0.98, blue: 0.81))
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Войди в аккаунт  или зарегистрируйся для начала использования")
                    .foregroundStyle(Color(red: 0.9, green: 0.98, blue: 0.81))
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .padding()
                
                LoginButton()
                RegisterButton()
                
            })
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    BeginScreenView()
}
