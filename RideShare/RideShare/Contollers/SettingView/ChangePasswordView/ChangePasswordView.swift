//
//  ChangePasswordView.swift
//  RideShare
//
//  Created by DREAMWORLD on 26/12/24.
//

import SwiftUI

struct ChangePasswordView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var oldPassword: String = ""
    @State private var newPassword: String = ""
    @State private var confirmPassword: String = ""
    @State private var isEyeOn: Bool = false

    var body: some View {
        VStack {
            ZStack {
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
                Text("Change Password")
                    .foregroundColor(.black)
                    .font(.custom(poppinsMedium, size: 18))
            }
            .padding(.horizontal, 16)
            
            HStack {
                Group {
                    if isEyeOn {
                        TextField("Old Password", text: $oldPassword)
                    } else {
                        SecureField("Old Password", text: $oldPassword)
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
                        TextField("New Password", text: $newPassword)
                    } else {
                        SecureField("New Password", text: $newPassword)
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
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Save")
                    .frame(maxWidth: .infinity)
                    .font(Font.custom(poppinsMedium, size: 16))
                    .padding()
                    .background(themePrimaryGreenColor)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .padding(.horizontal, 24)
            }
            .padding(.top, 30)
            Spacer()
        }
        .background(.white)
        .navigationBarHidden(true)
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    ChangePasswordView()
}
