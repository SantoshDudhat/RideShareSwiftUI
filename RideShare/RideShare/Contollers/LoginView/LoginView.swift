//
//  LoginView.swift
//  RideShare
//
//  Created by DREAMWORLD on 20/12/24.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var email: String = ""
    @State private var confirmPassword: String = ""
    @State private var isEyeOn: Bool = false
    @State private var isNavigate: Bool = false

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
                
                ScrollView {
                    HStack {
                        Text("Sign in with your email or phone number")
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

                    HStack {
                        Group {
                            if isEyeOn {
                                TextField("Enter Your Password", text: $confirmPassword)
                            } else {
                                SecureField("Enter Your Password", text: $confirmPassword)
                            }
                        }
                        .font(Font.custom(poppinsMedium, size: 16))
                        .padding(.vertical, 10)
                        .background(Color.clear)
                        .padding(.horizontal, 16)
                        .foregroundColor(.black)

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
                        Spacer()
                        Button(action: {
                            
                        }, label: {
                            Text("Forget password?")
                                .font(Font.custom(poppinsMedium, size: 14))
                                .foregroundColor(.red)
                        })
                    }
                    .padding(.horizontal, 16)
                    
                    Button {
                        isNavigate = true
                    } label: {
                        Text("Sign Up")
                            .frame(maxWidth: .infinity)
                            .font(Font.custom(poppinsMedium, size: 16))
                            .padding()
                            .background(themePrimaryGreenColor)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .padding(.horizontal, 24)
                    }
                    .padding(.top, 30)
                    .navigationDestination(isPresented: $isNavigate) {
                        TabbarView()
                    }
                    
                    HStack {
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(subTitleColor)
                        
                        Text("or")
                            .font(Font.custom(poppinsMedium, size: 16))
                            .foregroundColor(subTitleColor)
                        
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(subTitleColor)
                    }
                    .frame(height: 50)
                    .padding(.horizontal, 24)
                    
                    VStack {
                        Button {
                            
                        } label: {
                            Label("Sign up with Gmail", image: "ic_gmail")
                                .frame(maxWidth: .infinity)
                                .font(Font.custom(poppinsMedium, size: 16))
                                .padding()
                                .background(.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.hex("D0D0D0"), lineWidth: 1.5)
                                )
                                .foregroundColor(.black)
                                .cornerRadius(8)
                                .padding(.horizontal, 24)
                        }
                        .padding(.bottom, 16)
                        
                        Button {
                            
                        } label: {
                            Label("Sign up with Facebook", image: "ic_facebook")
                                .frame(maxWidth: .infinity)
                                .font(Font.custom(poppinsMedium, size: 16))
                                .padding()
                                .background(.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.hex("D0D0D0"), lineWidth: 1.5)
                                )
                                .foregroundColor(.black)
                                .cornerRadius(8)
                                .padding(.horizontal, 24)
                        }
                        .padding(.bottom, 16)
                        
                        Button {
                            
                        } label: {
                            Label("Sign up with Apple", image: "ic_apple")
                                .frame(maxWidth: .infinity)
                                .font(Font.custom(poppinsMedium, size: 16))
                                .padding()
                                .background(.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.hex("D0D0D0"), lineWidth: 1.5)
                                )
                                .foregroundColor(.black)
                                .cornerRadius(8)
                                .padding(.horizontal, 24)
                        }
                        
                        HStack(spacing: 0) {
                            Text("Don’t have an account? ")
                                .font(Font.custom(poppinsMedium, size: 16))
                                .foregroundColor(textFieldGrayBoarder)
                            
                            Text("Sign Up")
                                .font(Font.custom(poppinsMedium, size: 16))
                                .foregroundColor(themePrimaryGreenColor)
                                .onTapGesture {
                                    print("Terms tapped")
                                }
                        }
                        .padding(.top, 8)
                    }
                    .padding(.bottom, 8)
                }
                
                Spacer()
            }
            .background(.white)
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    LoginView()
}
