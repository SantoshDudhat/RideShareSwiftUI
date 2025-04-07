//
//  SendOTPView.swift
//  RideShare
//
//  Created by DREAMWORLD on 20/12/24.
//

import SwiftUI

struct SendOTPView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var email: String = ""
    @State private var isNavigateVerification: Bool = false

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        HStack {
                            Image(systemName: "chevron.backward")
                                .foregroundColor(.black)
                                .frame(width: 14)
                            Text("Back")
                                .font(Font.custom(poppinsRegular, size: 16))
                                .foregroundColor(.black)
                        }
                    })
                    Spacer()
                }
                .padding(.horizontal, 16)
                
                HStack {
                    Text("Verification email or phone number")
                        .font(Font.custom(poppinsMedium, size: 24))
                        .foregroundColor(.black)
                    Spacer()
                }
                .padding(.top, 24)
                .padding(.horizontal, 16)
                
                VStack {
                    TextField("Email or Phone Number", text: $email)
                        .font(Font.custom(poppinsMedium, size: 16))
                        .padding(.vertical, 10)
                        .background(Color.clear)
                        .padding(.horizontal, 16)
                        .foregroundColor(.black)
                }
                .frame(height: 60)
                .padding(.horizontal, 16)
                .padding(.top, 10)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(textFieldGrayBoarder, lineWidth: 1)
                        .padding(.horizontal, 16)
                        .padding(.top, 10)
                )
                
                Spacer()

                Button {
                    isNavigateVerification = true
                } label: {
                    Text("Send OTP")
                        .frame(maxWidth: .infinity)
                        .font(Font.custom(poppinsMedium, size: 16))
                        .padding()
                        .background(themePrimaryGreenColor)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .padding(.horizontal, 24)
                }
                .padding(.vertical, 30)
                .navigationDestination(isPresented: $isNavigateVerification) {
                    VerificationView(isFromForgotPassword: true)
                }
            }
            .background(.white)
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    SendOTPView()
}
