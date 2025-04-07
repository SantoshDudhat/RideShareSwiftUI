//
//  AboutView.swift
//  RideShare
//
//  Created by DREAMWORLD on 26/12/24.
//

import SwiftUI

struct AboutView: View {
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
                Text("About")
                    .foregroundColor(.black)
                    .font(.custom(poppinsMedium, size: 18))
            }
            .padding(.horizontal, 16)
            
            Text("Professional Rideshare Platform. Here we will provide you only interesting content, which you will like very much. We're dedicated to providing you the best of Rideshare, with a focus on dependability and Earning. We're working to turn our passion for Rideshare into a booming online website. We hope you enjoy our Rideshare as much as we enjoy offering them to you. I will keep posting more important posts on my Website for all of you. Please give your support and love.Professional Rideshare Platform. Here we will provide you only interesting content, which you will like very much. We're dedicated to providing you the best of Rideshare, with a focus on dependability and Earning. We're working to turn our passion for Rideshare into a booming online website. We hope you enjoy our Rideshare as much as we enjoy offering them to you. I will keep posting more important posts on my Website for all of you. Please give your support and love.")
                .multilineTextAlignment(.leading)
                .padding(.top, 24)
                .padding(.horizontal, 16)
                .foregroundColor(Color.hex("5A5A5A"))
                .font(.custom(poppinsRegular, size: 14))
            Spacer()
        }
        .background(.white)
        .navigationBarHidden(true)
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    AboutView()
}
