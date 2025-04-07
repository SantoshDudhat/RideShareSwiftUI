//
//  VerificationView.swift
//  RideShare
//
//  Created by DREAMWORLD on 18/12/24.
//

import SwiftUI

struct VerificationView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var otp: String = ""
    @State private var isNavigateSetPassword: Bool = false
    @State var showsAlert = false
    var isFromForgotPassword = false

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
                
                VStack(spacing: 10) {
                    Text("Phone verification")
                        .font(Font.custom(poppinsMedium, size: 24))
                        .foregroundColor(.black)
                    Text("Enter your OTP code")
                        .font(Font.custom(poppinsRegular, size: 16))
                        .foregroundColor(subTitleColor)
                }
                .padding(.top, 24)
                .padding(.horizontal, 16)
                
                AEOTPView(text: $otp, slotsCount: 5, width: (UIScreen.main.bounds.width - 80) * 0.95, height: 48, otpBackgroundColor: .clear, otpFilledBackgroundColor: .clear, otpFontSize: 24, otpFont: UIFont(name: poppinsSemiBold, size: 24) ?? .systemFont(ofSize: 24, weight: .semibold))
                    .padding(.top, 40)
                
                HStack {
                    Text("Didn’t receive code?")
                        .font(Font.custom(poppinsMedium, size: 16))
                        .foregroundColor(.black)
                    Text("Resend again")
                        .font(Font.custom(poppinsMedium, size: 16))
                        .foregroundColor(themePrimaryGreenColor)
                }
                .padding(.top, 10)
                
                Button {
                    if otp == "12345" {
                        isNavigateSetPassword = true
                    } else {
                        self.showsAlert.toggle()
                    }
                } label: {
                    Text("Verify")
                        .frame(maxWidth: .infinity)
                        .font(Font.custom(poppinsMedium, size: 16))
                        .padding()
                        .background(themePrimaryGreenColor)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .padding(.horizontal, 24)
                }
                .padding(.top, 30)
                .alert(isPresented: self.$showsAlert) {
                    Alert(title: Text("Please enter valid OTP!!"))
                }
                .navigationDestination(isPresented: $isNavigateSetPassword) {
                    SetPasswordView(isFromForgotPassword: isFromForgotPassword)
                }
                
                Spacer()
            }
            .background(.white)
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    VerificationView(isFromForgotPassword: true)
}
