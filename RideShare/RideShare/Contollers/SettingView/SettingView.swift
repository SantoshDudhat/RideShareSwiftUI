//
//  SettingView.swift
//  RideShare
//
//  Created by DREAMWORLD on 26/12/24.
//

import SwiftUI

enum SettingOptions: CaseIterable {
    case changePassword
    case changeLanguage
    case privacyPolicy
    case contactUs
    case deleteAccount
    
    var key: String {
        switch self {
        case .changePassword:
            return "Change Password"
        case .changeLanguage:
            return "Change Language"
        case .privacyPolicy:
            return "Privacy Policy"
        case .contactUs:
            return "Contact Us"
        case .deleteAccount:
            return "Delete Account"
        }
    }
}

struct SettingView: View {
    @Environment(\.presentationMode) var presentationMode
    var settings = SettingOptions.allCases
    @State var selectedOption: SettingOptions? = nil
    
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
                    Text("Settings")
                        .foregroundColor(.black)
                        .font(.custom(poppinsMedium, size: 18))
                }
                .padding(.horizontal, 16)
                
                VStack {
                    ForEach(settings, id: \.self) { setting in
                        HStack {
                            Text(setting.key)
                                .font(.custom(poppinsMedium, size: 14))
                                .padding()
                            Spacer()
                            Image(systemName: "chevron.right")
                                .padding(.trailing)
                        }
                        .onTapGesture {
                            selectedOption = setting
                        }
                        .overlay {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(themeGreenColor, lineWidth: 1)
                        }
                        .padding(.top, 16)
                        .padding(.horizontal, 16)
                    }
                    .navigationDestination(isPresented: .constant(selectedOption?.key == SettingOptions.changePassword.key)) {
                        ChangePasswordView()
                    }
                    .navigationDestination(isPresented: .constant(selectedOption?.key == SettingOptions.changeLanguage.key)) {
                        ChangeLanguageView()
                    }
                    .navigationDestination(isPresented: .constant(selectedOption?.key == SettingOptions.privacyPolicy.key)) {
                        PrivacyPolicyView()
                    }
                    .navigationDestination(isPresented: .constant(selectedOption?.key == SettingOptions.contactUs.key)) {
                        ContactUsView()
                    }
                    .navigationDestination(isPresented: .constant(selectedOption?.key == SettingOptions.deleteAccount.key)) {
                        DeleteAccountView()
                    }
                }
                .padding(.top, 8)
                Spacer()
            }
        }
        .background(.white)
        .navigationBarHidden(true)
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    SettingView()
}
