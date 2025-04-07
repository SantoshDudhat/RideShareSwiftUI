//
//  ProfileView.swift
//  RideShare
//
//  Created by DREAMWORLD on 20/12/24.
//

import SwiftUI

struct ProfileView: View {
    
    @Binding var isSideMenuOpen: Bool
    @State private var email: String = "nate@gmail.com"
    @State private var selectedGender: String = "Male"
    @State private var currentCode: String = "+1"
    @State private var phone: String = ""
    @State private var address: String = ""
    @State private var profileImage: Image? = nil
    @State private var showImagePicker = false
    @State private var showDropDrownMenu = false
    
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Button(action: {
                        print("Menu button tapped")
                        withAnimation {
                            isSideMenuOpen.toggle()
                        }
                    }) {
                        Image("ic_menu")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .shadow(radius: 4)
                    }
                    .padding(.leading, 16)
                    Spacer()
                }
                Text("Profile")
                    .foregroundColor(.black)
                    .font(.custom(poppinsMedium, size: 19))
            }
            Spacer()      
            
            ScrollView {
                ZStack {
                    // Circular Image Placeholder
                    if let profileImage = profileImage {
                        profileImage
                            .resizable()
                            .scaledToFill()
                            .frame(width: 138, height: 138)
                            .clipShape(Circle())
                    } else {
                        Circle()
                            .fill(Color.gray.opacity(0.5)) // Placeholder background
                            .frame(width: 138, height: 138)
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
                                    Image("ic_camera")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(.white)
                                        .font(.system(size: 20, weight: .bold))
                                }
                            }
                            .shadow(color: Color.black.opacity(0.3), radius: 3, x: 0, y: 2)
                        }
                    }
                    .padding(14)
                }
                .frame(width: 160, height: 160)
                .sheet(isPresented: $showImagePicker) {
                    ImagePicker(selectedImage: $profileImage)
                }
                
                Text("Nate Samson")
                    .font(.custom(poppinsMedium, size: 28))
                
                VStack {
                    TextField("Email", text: $email)
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
                    HStack {
                        Text(selectedGender)
                            .font(Font.custom(poppinsMedium, size: 16))
                            .padding(.leading, 16)
                        Spacer()
                        
                        Button {
                            showDropDrownMenu = true
                        } label: {
                            Image(systemName: "chevron.down")
                                .padding(.trailing, 16)
                                .foregroundColor(.black)
                        }
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
                    TextField("Address", text: $address)
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
                
                Button {
                    if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                       let window = scene.windows.first {
                        window.rootViewController = UIHostingController(rootView: WelcomeView())
                        window.makeKeyAndVisible()
                    }
                } label: {
                    Text("Logout")
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
                .padding(.horizontal, 26)
                .padding(.top, 16)
            }
        }
        .padding(.top, 44)
        .padding(.bottom, UIScreen.main.bounds.height / 9 / 1.3)
        .sheet(isPresented: $showDropDrownMenu) {
            VStack {
                ZStack {
                    HStack {
                        Spacer()
                        Button("Done") {
                            showDropDrownMenu = false
                        }
                        .font(Font.custom(poppinsMedium, size: 18))
                        .foregroundColor(.blue)
                    }
                    Text("Select Gender")
                        .font(Font.custom(poppinsMedium, size: 18))
                }
                
                Picker("Gender", selection: $selectedGender) {
                    Text("Male").tag("Male")
                    Text("Female").tag("Female")
                    Text("Other").tag("Other")
                }
                .pickerStyle(WheelPickerStyle())
            }
            .presentationDetents([.fraction(0.3)])
            .padding()
        }
    }
}

#Preview {
    ProfileView(isSideMenuOpen: .constant(false))
}
