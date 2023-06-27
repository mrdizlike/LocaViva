//
//  ContentView.swift
//  LocaViva
//
//  Created by Виктор on 27.06.2023.
//

import SwiftUI

struct ContentView: View {

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
                        .padding(.top)
                }
                .padding(.top, -380)
                
                Text("Привет!")
                    .foregroundStyle(Color(red: 0.9, green: 0.98, blue: 0.81))
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                Text("Посмотрите на новые горизонты и откройте для себя свой город с новой перспективы. LocaViva поможет вам находить уникальные места, интересные события и вдохновляющие приключения, которые скрываются прямо у вас под носом")
                    .foregroundStyle(Color(red: 0.9, green: 0.98, blue: 0.81))
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .padding()
                
                
            })
        }
    }
}

#Preview {
    ContentView()
}
