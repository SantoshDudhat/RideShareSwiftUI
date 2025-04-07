//
//  HelpAndSupportView.swift
//  RideShare
//
//  Created by DREAMWORLD on 26/12/24.
//

import SwiftUI

struct HelpAndSupportView: View {
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
                Text("Help and Support")
                    .foregroundColor(.black)
                    .font(.custom(poppinsMedium, size: 18))
            }
            .padding(.horizontal, 16)
            
            HStack {
                Text("Lorem ipsum dolor sit amet consectetur. Sit pulvinar mauris mauris eu nibh semper nisl pretium laoreet. Sed non faucibus ac lectus eu arcu. Nulla sit congue facilisis vestibulum egestas nisl feugiat pharetra. Odio sit tortor morbi at orci ipsum dapibus interdum. Lorem felis est aliquet arcu nullam pellentesque. Et habitasse ac arcu et nunc euismod rhoncus facilisis sollicitudin.")
                    .font(.custom(poppinsRegular, size: 16))
                    .foregroundColor(Color.hex("717171"))
            }
            .padding(.horizontal, 16)
            .padding(.top, 24)
            Spacer()
        }
        .background(.white)
        .navigationBarHidden(true)
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    HelpAndSupportView()
}
