//
//  SetPasswordView.swift
//  RideShare
//
//  Created by DREAMWORLD on 18/12/24.
//

import SwiftUI

struct SetPasswordView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var isEyeOn: Bool = false
    @State private var showAlert: Bool = false
    @State private var isNavigate: Bool = false
    @State private var alertMessage: String = ""
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
                    Text(isFromForgotPassword ? "Set New password" : "Set password")
                        .font(Font.custom(poppinsMedium, size: 24))
                        .foregroundColor(.black)
                    Text(isFromForgotPassword ? "Set your new password" : "Set your password")
                        .font(Font.custom(poppinsRegular, size: 16))
                        .foregroundColor(subTitleColor)
                }
                .padding(.top, 24)
                .padding(.horizontal, 16)

                HStack {
                    Group {
                        if isEyeOn {
                            TextField(isFromForgotPassword ? "Enter Your New Password" : "Enter Your Password", text: $password)
                        } else {
                            SecureField(isFromForgotPassword ? "Enter Your New Password" : "Enter Your Password", text: $password)
                        }
                    }
                    .font(Font.custom(poppinsMedium, size: 16))
                    .padding(.vertical, 10)
                    .background(Color.clear)
                    .padding(.horizontal, 16)

                    Spacer()

                    Button {
                        isEyeOn.toggle()
                    } label: {
                        Image(isEyeOn ? "ic_eye_on" : "ic_eye_off")
                    }
                    .padding(.horizontal, 16)
                }
                .frame(height: 60)
                .padding(.horizontal, 16)
                .padding(.top, 24)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(textFieldGrayBoarder, lineWidth: 1)
                        .padding(.horizontal, 16)
                        .padding(.top, 24)
                )

                HStack {
                    Group {
                        if isEyeOn {
                            TextField("Confirm Password", text: $confirmPassword)
                        } else {
                            SecureField("Confirm Password", text: $confirmPassword)
                        }
                    }
                    .font(Font.custom(poppinsMedium, size: 16))
                    .padding(.vertical, 10)
                    .background(Color.clear)
                    .padding(.horizontal, 16)

                    Spacer()

                    Button {
                        isEyeOn.toggle()
                    } label: {
                        Image(isEyeOn ? "ic_eye_on" : "ic_eye_off")
                    }
                    .padding(.horizontal, 16)
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
                
                HStack {
                    Text("Atleast 1 number or a special character")
                        .font(Font.custom(poppinsMedium, size: 14))
                        .foregroundColor(Color.hex("A6A6A6"))
                    Spacer()
                }
                .padding(.horizontal, 16)

                Button(action: validatePassword) {
                    Text(isFromForgotPassword ? "Save" : "Register")
                        .font(Font.custom(poppinsMedium, size: 16))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 54)
                        .background(themePrimaryGreenColor)
                        .cornerRadius(8)
                        .padding(.horizontal, 16)
                        .padding(.top, 24)
                }
                .navigationDestination(isPresented: $isNavigate) {
                    if !isFromForgotPassword {
                        CompleteProfileView()
                    } else {
                        LoginView()
                    }
                }

                Spacer()
            }
            .background(.white)
            .navigationBarHidden(true)
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }

    /// Validates the password criteria and checks if both fields match
    private func validatePassword() {
        if password.isEmpty || confirmPassword.isEmpty {
            alertMessage = "Password and Confirm Password cannot be empty."
            showAlert = true
        } else if password.count < 8 {
            alertMessage = "Password must be at least 8 characters long."
            showAlert = true
        } else if !password.contains(where: { $0.isUppercase }) {
            alertMessage = "Password must contain at least one uppercase letter."
            showAlert = true
        } else if !password.contains(where: { $0.isLowercase }) {
            alertMessage = "Password must contain at least one lowercase letter."
            showAlert = true
        } else if !password.contains(where: { $0.isNumber }) {
            alertMessage = "Password must contain at least one number."
            showAlert = true
        } else if password != confirmPassword {
            alertMessage = "Password and Confirm Password do not match."
            showAlert = true
        } else {
            alertMessage = "Password set successfully!"
            showAlert = false
            isNavigate = true
        }
    }
}

#Preview {
    SetPasswordView(isFromForgotPassword: true)
}
