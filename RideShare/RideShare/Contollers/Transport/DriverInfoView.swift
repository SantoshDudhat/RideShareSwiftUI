//
//  DriverInfoView.swift
//  RideShare
//
//  Created by DREAMWORLD on 27/12/24.
//

import SwiftUI

enum DriverInfoAction {
    case call
    case message
    case paymentMethod
}

struct DriverInfoView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var isModalVisible: Bool = false
    @Binding var selectedAction: DriverInfoAction?
    let detail: CarModel
    
    var body: some View {
        ZStack {
            Color.clear.ignoresSafeArea()
            
            if isModalVisible {
                ZStack {
                    Color.black.opacity(0.2)
                        .ignoresSafeArea()
                        .onTapGesture {
                            dismissWithAction(nil)
                        }
                    VStack {
                        Spacer()
                        VStack(spacing: 6) {
                            ZStack {
                                HStack {
                                    Spacer()
                                    Button(action: {
                                        dismissWithAction(nil)
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
                            
                            HStack {
                                Text("Your driver is coming in 3:35")
                                    .font(.custom(poppinsMedium, size: 16))
                                    .foregroundColor(Color.hex("5A5A5A"))
                                Spacer()
                            }
                            .padding(.horizontal, 16)
                            
                            Capsule()
                                .frame(maxWidth: .infinity, maxHeight: 1)
                                .foregroundColor(Color.hex("DDDDDD"))
                            
                            HStack {
                                Image("img_driver")
                                    .resizable()
                                    .frame(width: 54, height: 59)
                                
                                Spacer()
                                
                                VStack {
                                    HStack {
                                        Text("Sergio Ramsis")
                                            .font(.custom(poppinsMedium, size: 16))
                                            .foregroundColor(Color.hex("5A5A5A"))
                                        Spacer()
                                    }
                                    HStack {
                                        Image("ic_map_pin")
                                            .resizable()
                                            .frame(width: 16, height: 16)
                                        Text("800m (5mins away)")
                                            .font(.custom(poppinsRegular, size: 10))
                                            .foregroundColor(Color.hex("A0A0A0"))
                                        Spacer()
                                    }
                                    .padding(.top, -12)
                                    
                                    HStack {
                                        Image("ic_star")
                                            .resizable()
                                            .frame(width: 16, height: 16)
                                        
                                        Text("4.9 (531 reviews)")
                                            .font(.custom(poppinsRegular, size: 10))
                                            .foregroundColor(Color.hex("A0A0A0"))
                                        Spacer()
                                    }
                                    .padding(.top, -5)
                                }
                                Image(detail.carImage)
                            }
                            .padding()
                            
                            Capsule()
                                .frame(maxWidth: .infinity, maxHeight: 1)
                                .foregroundColor(Color.hex("DDDDDD"))
                            
                            HStack {
                                Text("Payment Method")
                                    .font(.custom(poppinsMedium, size: 16))
                                    .foregroundColor(Color.hex("5A5A5A"))
                                Spacer()
                                Text("$220.00")
                                    .font(.custom(poppinsMedium, size: 28))
                                    .foregroundColor(Color.hex("5A5A5A"))
                            }
                            .padding(.horizontal, 16)
                            
                            HStack {
                                Button {
                                    dismissWithAction(.paymentMethod)
                                } label: {
                                    Image("ic_visa_card")
                                        .resizable()
                                        .frame(width: 45, height: 35)
                                    
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("**** **** **** 8970")
                                            .font(.custom(poppinsMedium, size: 16))
                                            .foregroundColor(Color.hex("5A5A5A"))
                                        
                                        Text("Expires: 12/26")
                                            .font(.custom(poppinsMedium, size: 14))
                                            .foregroundColor(Color.hex("B8B8B8"))
                                    }
                                    Spacer()
                                }
                            }
                            .padding()
                            .background(themePrimaryLightGreenColor)
                            .cornerRadius(4)
                            .overlay {
                                RoundedRectangle(cornerRadius: 4)
                                    .stroke(themeGreenColor, lineWidth: 1)
                            }
                            .padding(.horizontal, 16)
                            
                            HStack {
                                Button {
                                    dismissWithAction(.call)
                                } label: {
                                    Text("Call")
                                        .font(.custom(poppinsMedium, size: 16))
                                        .foregroundColor(themePrimaryGreenColor)
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                }
                                .overlay {
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(themePrimaryGreenColor, lineWidth: 1)
                                }
                                
                                Button {
                                    dismissWithAction(.message)
                                } label: {
                                    Text("Message")
                                        .font(.custom(poppinsMedium, size: 16))
                                        .frame(maxWidth: .infinity)
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(themePrimaryGreenColor)
                                        .cornerRadius(8)
                                }
                            }
                            .padding(.top, 32)
                            .padding(.horizontal, 16)
                        }
                        .padding(.bottom, 20)
                        .background(Color.white)
                        .cornerRadius(16, corners: [.topLeft, .topRight])
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
    private func dismissWithAction(_ action: DriverInfoAction?) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            isModalVisible = false
            selectedAction = action
            presentationMode.wrappedValue.dismiss()
        }
    }
}

#Preview {
    DriverInfoView(selectedAction: .constant(nil), detail: CarModel(name: "BMW 18", carImage: "ic_bmw_18", type: "Automatic", seat: "3 seats", fuleType: "Octane", distation: "800m (5mins away)"))
}
