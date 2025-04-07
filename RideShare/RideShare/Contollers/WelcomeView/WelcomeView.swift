//
//  WelcomeView.swift
//  RideShare
//
//  Created by DREAMWORLD on 17/12/24.
//

import SwiftUI

struct WelcomeView: View {
    @State private var isNavigateSignup: Bool = false

    var body: some View {
        NavigationStack {
            VStack {
                Image("img_welcome")
                    .padding(.top, 70)
                
                VStack {
                    Text("Welcome")
                        .font(Font.custom(poppinsMedium, size: 24))
                        .padding(.bottom, 4)
                    Text("Have a better sharing experience")
                        .font(Font.custom(poppinsMedium, size: 14))
                        .foregroundColor(subTitleColor)
                }
                .padding(.top, 24)
                .padding(.horizontal, 50)
                Spacer()
                
                VStack {
                    Button {
                        isNavigateSignup = true
                    } label: {
                        Text("Create an account")
                            .frame(maxWidth: .infinity)
                            .font(Font.custom(poppinsMedium, size: 16))
                            .padding()
                            .background(themePrimaryGreenColor)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .padding(.horizontal, 24)
                    }
                    .padding(.bottom, 6)
                    .navigationDestination(isPresented: $isNavigateSignup, destination: {
                        SignUpView()
                    })
                    
                    Button {
                        
                    } label: {
                        Text("Log In")
                            .frame(maxWidth: .infinity)
                            .font(Font.custom(poppinsMedium, size: 16))
                            .padding()
                            .background(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(themePrimaryGreenColor, lineWidth: 1)
                            )
                            .foregroundColor(themePrimaryGreenColor)
                            .cornerRadius(8)
                            .padding(.horizontal, 24)
                    }
                }
                .padding(.bottom, 30)
            }
            .background(.white)
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    WelcomeView()
}
