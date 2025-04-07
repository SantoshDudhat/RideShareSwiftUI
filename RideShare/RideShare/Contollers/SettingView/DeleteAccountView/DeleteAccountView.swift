//
//  DeleteAccountView.swift
//  RideShare
//
//  Created by DREAMWORLD on 26/12/24.
//

import SwiftUI

struct DeleteAccountView: View {
    @Environment(\.presentationMode) var presentationMode

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
                Text("Delete Account")
                    .foregroundColor(.black)
                    .font(.custom(poppinsMedium, size: 18))
            }
            .padding(.horizontal, 16)
            
            HStack {
                Text("Are you sure you want to delete your account? Please read how account deletion will affect.\nDeleting your account removes personal information our database. Tour email becomes permanently reserved and same email cannot be re-use to register a new account.")
                    .font(.custom(poppinsRegular, size: 16))
                    .foregroundColor(Color.hex("717171"))
            }
            .padding(.horizontal, 16)
            .padding(.top, 24)
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Delete")
                    .frame(maxWidth: .infinity)
                    .font(Font.custom(poppinsMedium, size: 16))
                    .padding()
                    .background(Color.hex("F44336"))
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
    DeleteAccountView()
}
