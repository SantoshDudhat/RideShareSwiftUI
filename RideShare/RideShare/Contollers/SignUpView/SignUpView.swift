//
//  SignUpView.swift
//  RideShare
//
//  Created by DREAMWORLD on 17/12/24.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var currentCode: String = "+1"
    @State private var phone: String = ""
    var genders = ["Male", "Female", "Other"]
    @State private var selectedOptionIndex =  0
    @State private var showDropdown =  false
    @State private var selectedOption: String = "Gender"
    @State private var checkToggle = false
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
                
                ScrollView {
                    HStack {
                        Text("Sign up with your email or phone number")
                            .font(Font.custom(poppinsMedium, size: 24))
                            .foregroundColor(.black)
                        Spacer()
                    }
                    .padding(.top, 24)
                    .padding(.horizontal, 16)
                    
                    VStack {
                        TextField("Name", text: $name)
                            .font(Font.custom(poppinsMedium, size: 16))
                            .padding(.vertical, 10)
                            .background(Color.clear)
                            .padding(.horizontal, 16)
                    }
                    .frame(height: 60)
                    .padding(.horizontal, 16)
                    .padding(.top, 16)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(textFieldGrayBoarder, lineWidth: 1)
                            .padding(.horizontal, 16)
                            .padding(.top, 16)
                    )
                    
                    VStack {
                        TextField("Email", text: $email)
                            .font(Font.custom(poppinsMedium, size: 16))
                            .padding(.vertical, 10)
                            .background(Color.clear)
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
                    
                    VStack {
                        HStack {
                            PhoneNumberSelector(currentCode: $currentCode)
                                .foregroundColor(Color.gray)
                                .padding(.leading, 16)
                            Divider()
                                .padding(.horizontal, 8)
                                .padding(.vertical, 8)
                            Text(currentCode)
                            TextField("Your mobile number", text: $phone, onEditingChanged: {_ in
                                // remove the first character is 0 for phone number format compliance
                                if phone.first == "0" {
                                    self.phone = String(phone.dropFirst())
                                }
                            }, onCommit: {
                                if phone.first == "0" {
                                    self.phone = String(phone.dropFirst())
                                }
                            })
                            .padding(.trailing, 16)
                            .font(Font.custom(poppinsMedium, size: 16))
                            .background(Color.clear)
                            .keyboardType(.numberPad)
                        }
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
                    
                    VStack {
                        Menu {
                            ForEach(genders, id: \.self) { option in
                                Button(action: { selectedOption = option }, label: {
                                    Text(option)
                                    if selectedOption == option {
                                        Image(systemName: "checkmark")
                                    }
                                })
                            }
                        } label: {
                            HStack {
                                Text(selectedOption)
                                    .padding(.leading, 16)
                                    .font(Font.custom(poppinsMedium, size: 16))
                                    .foregroundColor(selectedOption == "Gender" ? Color.hex("C5C5C7") : .black)
                                Spacer()
                                Image(systemName: "chevron.down")
                                    .padding(.trailing, 16)
                                    .foregroundColor(.black)
                            }
                        }
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
                        VStack {
                            Button {
                                checkToggle.toggle()
                            } label: {
                                Image(checkToggle ? "ic_checked" : "ic_uncheck")
                            }
                            Spacer()
                        }
                        
                        VStack {
                            HStack(spacing: 0) {
                                Text("By signing up. you agree to the ")
                                    .font(Font.custom(poppinsMedium, size: 12))
                                    .foregroundColor(textFieldGrayBoarder)
                                Text("Terms of service")
                                    .font(Font.custom(poppinsMedium, size: 12))
                                    .foregroundColor(themePrimaryGreenColor)
                                    .onTapGesture {
                                        print("Terms tapped")
                                    }
                                Spacer()
                            }
                            
                            HStack(spacing: 0) {
                                Text("and ")
                                    .font(Font.custom(poppinsMedium, size: 12))
                                    .foregroundColor(textFieldGrayBoarder)
                                
                                Text("Privacy policy.")
                                    .font(Font.custom(poppinsMedium, size: 12))
                                    .foregroundColor(themePrimaryGreenColor)
                                    .onTapGesture {
                                        print("Policy tapped")
                                    }
                                Spacer()
                            }
                        }
                        .background(Color.white)
                        
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 16)
                    
                    Button {
                        isNavigateVerification = true
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
                    .navigationDestination(isPresented: $isNavigateVerification) {
                        VerificationView(isFromForgotPassword: false)
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
                            Text("Already have an account? ")
                                .font(Font.custom(poppinsMedium, size: 16))
                                .foregroundColor(textFieldGrayBoarder)
                            
                            Text("Sign in")
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
    SignUpView()
}
