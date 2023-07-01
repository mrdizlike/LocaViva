//
//  ProfileView.swift
//  LocaViva
//
//  Created by Виктор on 30.06.2023.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewMode
    @State private var timer = Timer.publish(every: 1, on: .main, in: .default).autoconnect()
    @State private var secondsWaited: Int = 0
    
    //НЕОБХОДИМО подумать как реализовать эту тему лучше. Но главное, что работает 
    var body: some View {
        if let user = viewModel.currentUser {
            List {
                Section {
                    Text(user.firstName)
                    Button {
                        viewModel.signOut()
                    } label: {
                        Text("signOut")
                    }
                }
                .onAppear {
                    secondsWaited = 0
                }
            }
        } else {
            Text("wait")
                .onAppear{
                    startTimer()
                }
                .onReceive(timer) {_ in
                    waitLog()
                    secondsWaited += 1
                }
        }
        
        if secondsWaited >= 5 {
            ErrorLoginView()
        }
    }
    
    private func startTimer() {
        timer = Timer.publish(every: 1, on: .main, in: .default).autoconnect()
    }
    
    func waitLog() {
        Task {
            await viewModel.fetchUser()
        }
    }
}

struct ErrorLoginView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Text("Что-то пошло не так. Попробуй еще раз")
        Button{
            presentationMode.wrappedValue.dismiss()
        } label: {
            Text("Назад")
                .font(.headline)
                .foregroundStyle(.black)
                .frame(width: 260, height: 65)
                .background(Color(red: 1, green: 0.81, blue: 0.33))
                .cornerRadius(45)
        }
        .padding(.top)
    }
}

#Preview {
    ProfileView()
}
