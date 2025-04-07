//
//  ConfirmSelectedLocationView.swift
//  RideShare
//
//  Created by DREAMWORLD on 27/12/24.
//

import SwiftUI

struct ConfirmSelectedLocationView: View {
    
    @Binding var selectedLocationData: String?
    @Binding var currentLocationData: String?
    @Binding var isDismissed: Bool
    
    @State private var isModalVisible: Bool = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color.clear.ignoresSafeArea()
            
            if isModalVisible {
                ZStack {
                    Color.black.opacity(0.2)
                        .ignoresSafeArea()
                        .onTapGesture {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                isModalVisible = false
                                isDismissed = true
                                presentationMode.wrappedValue.dismiss()
                            }
                        }
                    VStack {
                        Spacer()
                        VStack(spacing: 16) {
                            ZStack {
                                HStack {
                                    Spacer()
                                    Button(action: {
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                            isModalVisible = false
                                            isDismissed = true
                                            presentationMode.wrappedValue.dismiss()
                                        }
                                    }, label: {
                                        HStack {
                                            Image("ic_close")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                                .padding(.horizontal, 16)
                                        }
                                    })
                                }
                                Capsule()
                                    .frame(width: 134, height: 5)
                                    .foregroundColor(Color.hex("141414"))
                            }
                            .padding(.top, 8)
                            
                            Text("Select address")
                                .font(.custom(poppinsMedium, size: 20))
                                .foregroundColor(Color.hex("5A5A5A"))
                            
                            Capsule()
                                .frame(maxWidth: .infinity, maxHeight: 1)
                                .foregroundColor(Color.hex("DDDDDD"))
                            
                            HStack {
                                Image("ic_location_line")
                                
                                Spacer()
                                
                                VStack(spacing: 10) {
                                    VStack(alignment: .leading) {
                                        Text("Current Location")
                                            .font(Font.custom(poppinsMedium, size: 16))
                                            .foregroundColor(Color.hex("5A5A5A"))
                                        Text(currentLocationData ?? "")
                                            .font(Font.custom(poppinsRegular, size: 12))
                                            .foregroundColor(Color.hex("B8B8B8"))
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    VStack(alignment: .leading) {
                                        Text("Office")
                                            .font(Font.custom(poppinsMedium, size: 16))
                                            .foregroundColor(Color.hex("5A5A5A"))
                                        Text(selectedLocationData ?? "")
                                            .font(Font.custom(poppinsRegular, size: 12))
                                            .foregroundColor(Color.hex("B8B8B8"))
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                Spacer()
                            }
                            .padding(.horizontal, 16)
                            
                            Button {
                                isModalVisible = false
                                isDismissed = false
                                presentationMode.wrappedValue.dismiss()
                            } label: {
                                Text("Confirm")
                                    .frame(maxWidth: .infinity)
                                    .font(Font.custom(poppinsMedium, size: 16))
                                    .padding()
                                    .background(themePrimaryGreenColor)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                                    .padding(.horizontal, 16)
                            }
                            
                        }
                        .padding(.bottom)
                        .background(Color.white)
                        .cornerRadius(16, corners: [.topLeft, .topRight])
                        .animation(.easeInOut, value: isModalVisible)
                    }
                    .background(Color.clear)
                    .edgesIgnoringSafeArea(.all)
                }
                .background(Color.clear)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                withAnimation {
                    isModalVisible = true
                }
            }
        }
        .background(BackgroundClearView())
    }
}

#Preview {
    ConfirmSelectedLocationView(selectedLocationData: .constant(""), currentLocationData: .constant(""), isDismissed: .constant(false))
}
