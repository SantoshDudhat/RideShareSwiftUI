//
//  PrivacyPolicyView.swift
//  RideShare
//
//  Created by DREAMWORLD on 26/12/24.
//

import SwiftUI

struct PrivacyPolicyView: View {
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
                Text("Privacy Policy")
                    .foregroundColor(.black)
                    .font(.custom(poppinsMedium, size: 18))
                
            }
            .padding(.horizontal, 16)
            
            HStack {
                Text("Privacy Policy for Ride share")
                    .font(.custom(poppinsMedium, size: 18))
                Spacer()
            }
            .padding(.horizontal, 16)
            .padding(.top, 24)
            
            HStack {
                Text("At Rideshare, accessible from rideshare.com, one of our main priorities is the privacy of our visitors. This Privacy Policy document contains types of information that is collected and recorded by rideshare and how we use it.\nIf you have additional questions or require more information about our Privacy Policy, do not hesitate to contact us.\nThis Privacy Policy applies only to our online activities and is valid for visitors to our website with regards to the information that they shared and/or collect in rideshare. This policy is not applicable to any information collected offline or via channels other than this website. Our Privacy Policy was created with the help of the Free Privacy Policy Generator.")
                    .font(.custom(poppinsRegular, size: 16))
                    .foregroundColor(Color.hex("717171"))
            }
            .padding(.horizontal, 16)
            .padding(.top, 8)
            Spacer()
        }
        .background(.white)
        .navigationBarHidden(true)
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    PrivacyPolicyView()
}
