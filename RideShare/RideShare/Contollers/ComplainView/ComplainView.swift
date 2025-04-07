//
//  ComplainView.swift
//  RideShare
//
//  Created by DREAMWORLD on 25/12/24.
//

import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct ComplainView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var isNavigateVerification: Bool = false

    let complaintFeedbackMessages: [String] = [
        // Driver-Related Issues
        "Driver was rude or unprofessional.",
        "Driver was reckless or unsafe.",
        "Driver took an unnecessarily long route.",
        "Driver arrived late.",
        "Driver canceled the ride without notice.",

        // Vehicle-Related Issues
        "Vehicle was unclean or smelled bad.",
        "Vehicle was not as described (wrong model or license plate).",
        "Vehicle was poorly maintained or unsafe.",

        // App-Related Issues
        "Incorrect fare charged.",
        "Difficulty booking a ride.",
        "App crashed or froze during the booking process.",
        "Payment method not working.",
        "Location tracking was inaccurate.",

        // Trip-Related Issues
        "Pickup or drop-off location was incorrect.",
        "Trip was canceled without a valid reason.",
        "Long wait time for driver arrival.",
        "I was overcharged for my ride.",
        "My promo code or discount did not apply.",

        // Safety and Security
        "Driver made me feel unsafe.",
        "I left an item in the vehicle.",
        "Unauthorized charges on my account.",
        "Driver refused to wear a mask.",
        "Driver did not follow traffic laws.",

        // General Feedback
        "Poor customer service experience.",
        "Need assistance with my ride.",
        "Other (please specify)."
    ]
    @State private var selectedOption: String = "Vehicle not clean"
    @State private var isDropdownPresented: Bool = false
    @State private var complaintText: String = ""

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
                Text("Complain")
                    .foregroundColor(.black)
                    .font(.custom(poppinsMedium, size: 18))
                
            }
            .padding(.horizontal, 16)
            
            Button(action: {
                isDropdownPresented.toggle()
            }) {
                HStack {
                    Text(selectedOption)
                        .font(.custom(poppinsMedium, size: 16))
                        .foregroundColor(.black)
                    Spacer()
                    Image(systemName: isDropdownPresented ? "chevron.up" : "chevron.down")
                        .foregroundColor(.black)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(textFieldGrayBoarder, lineWidth: 1)
                )
            }
            .overlay(
                // Show the Dropdown if Button is Tapped
                isDropdownPresented ? DropDownWrapper(
                    selectedOption: { item in
                        isDropdownPresented.toggle()
                        selectedOption = item
                    }, options: complaintFeedbackMessages
                )
                .frame(height: 0) : nil
            )
            .padding(.top, 24)
            .padding(.horizontal, 16)
            
            TextViewWrapper(
                text: $complaintText,
                placeholder: "Write your complaint here (minimum 10 characters)",
                characterLimit: 200
            )
            .padding(.horizontal, 16)
            .padding(.top, 10)
            .frame(height: 140)
            
            Button {
                isNavigateVerification = true
            } label: {
                Text("Submit")
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
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
        .background(.white)
        .navigationBarHidden(true)
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    ComplainView()
}
