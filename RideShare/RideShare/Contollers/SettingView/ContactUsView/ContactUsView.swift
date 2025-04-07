//
//  ContactUsView.swift
//  RideShare
//
//  Created by DREAMWORLD on 27/12/24.
//

import SwiftUI

struct ContactUsView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var isNavigate: Bool = false
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var currentCode: String = "+1"
    @State private var phone: String = ""
    @State private var message: String = ""

    var body: some View {
        NavigationStack {
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
                    Text("Contact Us")
                        .foregroundColor(.black)
                        .font(.custom(poppinsMedium, size: 18))
                }
                .padding(.horizontal, 16)
                
                ScrollView {
                    VStack(spacing: 0) {
                        Text("Contact us for Ride share")
                            .foregroundColor(.black)
                            .font(.custom(poppinsMedium, size: 18))
                        Text("Address")
                            .foregroundColor(.black)
                            .font(.custom(poppinsMedium, size: 16))
                            .padding(.top, 8)
                        Text("House# 72, Road# 21, Banani, Dhaka-1213 (near Banani Bidyaniketon School &\nCollege, beside University of South Asia)\n\nCall : 13301 (24/7)\nEmail : support@pathao.com")
                            .foregroundColor(Color.hex("898989"))
                            .font(.custom(poppinsMedium, size: 12))
                            .multilineTextAlignment(.center)
                            .padding(.top, 4)
                        Text("Send Message")
                            .foregroundColor(.black)
                            .font(.custom(poppinsMedium, size: 16))
                            .padding(.top, 24)
                    }
                    
                    VStack {
                        TextField("Name", text: $name)
                            .font(Font.custom(poppinsMedium, size: 16))
                            .padding(.vertical, 10)
                            .background(Color.clear)
                            .padding(.horizontal, 16)
                    }
                    .frame(height: 60)
                    .padding(.top, 16)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(textFieldGrayBoarder, lineWidth: 1)
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
                    .padding(.top, 10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(textFieldGrayBoarder, lineWidth: 1)
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
                    .padding(.top, 10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(textFieldGrayBoarder, lineWidth: 1)
                            .padding(.top, 10)
                    )
                    
                    TextViewWrapper(
                        text: $message,
                        placeholder: "Write your text",
                        characterLimit: 200
                    )
                    .padding(.top, 10)
                    .frame(height: 120)
                }
                .scrollIndicators(.hidden)
                .padding(.top, 16)
                .padding(.horizontal, 16)
                
                Button {
                    isNavigate = true
                } label: {
                    Text("Send Message")
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
                    EmptyView()
                }

                Spacer()
            }
            .background(.white)
            .navigationBarHidden(true)
            .toolbar(.hidden, for: .tabBar)
        }
    }
}

#Preview {
    ContactUsView()
}
