//
//  ReferralView.swift
//  RideShare
//
//  Created by DREAMWORLD on 26/12/24.
//

import SwiftUI

struct ReferralView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var referralCode: String = ""
    @State private var isNavigateVerification: Bool = false

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
                Text("Referral")
                    .foregroundColor(.black)
                    .font(.custom(poppinsMedium, size: 18))
            }
            .padding(.horizontal, 16)
            
            HStack {
                Text("Refer a friend and Earn $20")
                    .font(.custom(poppinsMedium, size: 16))
                Spacer()
            }
            .padding(.horizontal, 16)
            .padding(.top, 24)

            HStack {
                TextField("Enter Referral Code", text: $referralCode)
                    .font(.custom(poppinsMedium, size: 16))
                    .padding()
                Button(action: {
                    UIPasteboard.general.string = referralCode
                }, label: {
                    Image("ic_copy")
                        .padding(.trailing)
                })
            }
            .padding(.horizontal, 16)
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(textFieldGrayBoarder, lineWidth: 1)
                    .padding(.horizontal, 16)
            }
            
            Button {
                isNavigateVerification = true
            } label: {
                Text("Invite")
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
                EmptyView()
            }
            Spacer()
        }
        .background(.white)
        .navigationBarHidden(true)
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    ReferralView()
}
