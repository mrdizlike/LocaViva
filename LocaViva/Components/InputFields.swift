//
//  InputFields.swift
//  LocaViva
//
//  Created by Виктор on 28.06.2023.
//

import SwiftUI
import PhoneNumberKit

struct InputField: View {
    @Binding var text: String
    let title: String
    let placeholder: String
    var isSecureField = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text(title)
                .foregroundStyle(.white)
                .fontWeight(.semibold)
                .font(.footnote)

            
            if isSecureField {
                SecureField("", text: $text)
                    .placeholder(when: text.isEmpty){
                        Text(placeholder)
                            .foregroundStyle(.white)
                            .opacity(0.6)
                    }
                    .padding(.leading)
                    .foregroundStyle(.white)
                    .font(.system(size: 14))
                    .frame(width: 360, height: 50, alignment: .leading)
                    .background(Color(red:0.07, green: 0.46, blue: 0.28))
                    .cornerRadius(15)
            } else {
                TextField("", text: $text)
                    .placeholder(when: text.isEmpty){
                        Text(placeholder)
                            .foregroundStyle(.white)
                            .opacity(0.6)
                    }
                    .padding(.leading)
                    .foregroundStyle(.white)
                    .font(.system(size: 14))
                    .frame(width: 360, height: 50, alignment: .leading)
                    .background(Color(red:0.07, green: 0.46, blue: 0.28))
                    .cornerRadius(15)
            }
            
        }
    }
}

struct PhoneNumberFormatter: ViewModifier {
    @Binding var phoneNumber: String
    @State private var phoneNumberKit = PhoneNumberKit()
    
    func body(content: Content) -> some View {
        content
            .onReceive(NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification), perform: {_ in formatPhoneNumber()
            })
    }
    
    private func formatPhoneNumber() {
        do {
            let parsedPhoneNumber = try phoneNumberKit.parse(phoneNumber)
            let formattedNumber = phoneNumberKit.format(parsedPhoneNumber, toType: .national)
            phoneNumber = formattedNumber
        } catch {
            print("Некорректный номер телефона: \(error)")
        }
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}

