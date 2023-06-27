//
//  Buttons.swift
//  LocaViva
//
//  Created by Виктор on 28.06.2023.
//

import SwiftUI

struct NextButton: View {
    @State var sceneView: AnyView
    
    var body: some View {
        NavigationLink(destination: sceneView) {
            Text("Дальше")
                .font(.headline)
                .foregroundStyle(.white)
                .frame(width: 260, height: 65)
                .background(Color.blue)
                .cornerRadius(45)
        }
    }
}

struct LoginButton: View {
    @State var sceneView: AnyView?
    
    var body: some View {
        NavigationLink(destination: sceneView) {
            Text("Вход")
                .font(.headline)
                .frame(width: 260, height: 65)
                .background(Color(red: 1, green: 0.81, blue: 0.33))
                .cornerRadius(45)
        }
    }
}

struct RegisterButton: View {
    @State var sceneView: AnyView?
    
    var body: some View {
        NavigationLink(destination: sceneView) {
            Text("Регистрация")
                .font(.headline)
                .foregroundStyle(.white)
                .frame(width: 260, height: 65)
                .background(Color.blue)
                .cornerRadius(45)
        }
    }
}
