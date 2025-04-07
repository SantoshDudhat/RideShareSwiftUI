//
//  OnboardingOne.swift
//  RideShare
//
//  Created by DREAMWORLD on 16/12/24.
//

import SwiftUI

struct OnboardingOne: View {
    @State private var isNavigating: Bool = false
    @State private var isNavigateWelcome: Bool = false

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Spacer()
                    Button("Skip") {
                        isNavigateWelcome = true
                    }
                    .navigationDestination(isPresented: $isNavigateWelcome, destination: {
                        WelcomeView()
                    })
                    .font(Font.custom(poppinsRegular, size: 16))
                    .foregroundColor(.black)
                }
                .padding(.horizontal, 16)
                
                Image("img_onboarding_1")
                    .padding(.top, 50)
                
                VStack {
                    Text("Anywhere you are")
                        .font(Font.custom(poppinsMedium, size: 24))
                        .padding(.bottom, 4)
                    Text("Sell houses easily with the help of\nListenoryx and to make this line big I am writing more.")
                        .multilineTextAlignment(.center)
                        .font(Font.custom(poppinsMedium, size: 14))
                        .foregroundColor(subTitleColor)
                }
                .padding(.top, 30)
                .padding(.horizontal, 50)
                Spacer()
                ZStack {
                    ActivityProgressView(color: themeGreenColor, backgroundColor: themeLightGreenColor, progress: 0.33)
                        .frame(width: 86, height: 86)
                        .overlay {
                            Rectangle()
                                .foregroundColor(themeGreenColor)
                                .frame(width: 74, height: 74)
                                .cornerRadius(37, corners: .allCorners)
                        }
                    Button(action: {
                        isNavigating = true
                    }, label: {
                        Image("ic_next_arrow")
                    })
                    .navigationDestination(isPresented: $isNavigating, destination: {
                        OnboardingTwo()
                    })
                }
                .padding(.bottom, 30)
            }
            .background(.white)
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    OnboardingOne()
}
