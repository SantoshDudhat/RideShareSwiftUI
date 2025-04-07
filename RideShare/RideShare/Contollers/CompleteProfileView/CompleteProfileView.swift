//
//  CompleteProfileView.swift
//  RideShare
//
//  Created by DREAMWORLD on 18/12/24.
//

import SwiftUI

struct CompleteProfileView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var profileImage: Image? = nil
    @State private var showImagePicker = false
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var currentCode: String = "+1"
    @State private var phone: String = ""
    @State private var street: String = ""
    @State private var currentCity: City?
    @State private var isNavigate: Bool = false

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
                    .padding(.horizontal, 16)
                    
                    Text("Profile")
                        .font(Font.custom(poppinsMedium, size: 18))
                }
                
                ScrollView {
                    ZStack {
                        // Circular Image Placeholder
                        if let profileImage = profileImage {
                            profileImage
                                .resizable()
                                .scaledToFill()
                                .frame(width: 120, height: 120)
                                .clipShape(Circle())
                        } else {
                            Circle()
                                .fill(Color.gray.opacity(0.5)) // Placeholder background
                                .frame(width: 120, height: 120)
                        }
                        
                        // Camera Button Overlay
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                Button(action: {
                                    showImagePicker = true
                                }) {
                                    ZStack {
                                        Circle()
                                            .fill(Color.green)
                                            .frame(width: 40, height: 40)
                                        Image(systemName: "camera")
                                            .foregroundColor(.white)
                                            .font(.system(size: 20, weight: .bold))
                                    }
                                }
                                .shadow(color: Color.black.opacity(0.3), radius: 3, x: 0, y: 2)
                            }
                        }
                        .padding(8) // Padding to align the button properly within the ZStack
                    }
                    .frame(width: 140, height: 140) // Overall frame
                    .sheet(isPresented: $showImagePicker) {
                        ImagePicker(selectedImage: $profileImage) // Open image picker when tapped
                    }
                    
                    VStack {
                        TextField("Full Name", text: $name)
                            .font(Font.custom(poppinsMedium, size: 16))
                            .padding(.vertical, 10)
                            .background(Color.clear)
                            .padding(.horizontal, 16)
                    }
                    .frame(height: 60)
                    .padding(.horizontal, 16)
                    .padding(.top, 16)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(textFieldGrayBoarder, lineWidth: 1)
                            .padding(.horizontal, 16)
                            .padding(.top, 16)
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
                    .padding(.horizontal, 16)
                    .padding(.top, 10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(textFieldGrayBoarder, lineWidth: 1)
                            .padding(.horizontal, 16)
                            .padding(.top, 10)
                    )
                    
                    VStack {
                        TextField("Email", text: $email)
                            .font(Font.custom(poppinsMedium, size: 16))
                            .padding(.vertical, 10)
                            .background(Color.clear)
                            .padding(.horizontal, 16)
                    }
                    .frame(height: 60)
                    .padding(.horizontal, 16)
                    .padding(.top, 10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(textFieldGrayBoarder, lineWidth: 1)
                            .padding(.horizontal, 16)
                            .padding(.top, 10)
                    )
                    
                    VStack {
                        TextField("Street", text: $street)
                            .font(Font.custom(poppinsMedium, size: 16))
                            .padding(.vertical, 10)
                            .background(Color.clear)
                            .padding(.horizontal, 16)
                    }
                    .frame(height: 60)
                    .padding(.horizontal, 16)
                    .padding(.top, 10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(textFieldGrayBoarder, lineWidth: 1)
                            .padding(.horizontal, 16)
                            .padding(.top, 10)
                    )
                    
                    VStack {
                        CitySelector(currentCity: currentCity, isDistrict: false)
                    }
                    .frame(height: 60)
                    .padding(.horizontal, 16)
                    .padding(.top, 10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(textFieldGrayBoarder, lineWidth: 1)
                            .padding(.horizontal, 16)
                            .padding(.top, 10)
                    )
                    
                    VStack {
                        CitySelector(currentCity: currentCity, isDistrict: true)
                    }
                    .frame(height: 60)
                    .padding(.horizontal, 16)
                    .padding(.top, 10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(textFieldGrayBoarder, lineWidth: 1)
                            .padding(.horizontal, 16)
                            .padding(.top, 10)
                    )
                    
                    HStack(spacing: 16) {
                        Button {
                            
                        } label: {
                            Text("Cancel")
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
                        }
                        
                        Button {
                            isNavigate = true
                        } label: {
                            Text("Save")
                                .frame(maxWidth: .infinity)
                                .font(Font.custom(poppinsMedium, size: 16))
                                .padding()
                                .background(themePrimaryGreenColor)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        .navigationDestination(isPresented: $isNavigate, destination: {
                            TabbarView()
                        })
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 24)
                }
                Spacer()
            }
            .background(.white)
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    CompleteProfileView()
}
