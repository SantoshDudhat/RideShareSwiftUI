//
//  ThankYouView.swift
//  RideShare
//
//  Created by DREAMWORLD on 27/12/24.
//

import SwiftUI

struct ThankYouView: View {
    
    @Binding var selectedLocationData: String?
    @Binding var currentLocationData: String?
    var detail: CarModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    ZStack {
                        HStack {
                            Button(action: {
                                if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                                   let window = scene.windows.first {
                                    window.rootViewController = UIHostingController(rootView: TabbarView(selectedTab: .home, isDriverInfoOpen: false))
                                }
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
                    }
                    .padding(.horizontal, 16)
                    
                    Spacer()
                    
                    VStack {
                        Image("ic_payment_success")
                            .resizable()
                            .frame(width: 124, height: 124)
                        
                        Text("Thank you")
                            .font(Font.custom(poppinsMedium, size: 20))
                            .foregroundColor(Color.hex("5A5A5A"))
                            .padding(.top, 24)
                        
                        Text("Your booking has been placed sent to\nMd. Sharif Ahmed")
                            .multilineTextAlignment(.center)
                            .font(Font.custom(poppinsMedium, size: 12))
                            .foregroundColor(Color.hex("5A5A5A"))
                    }
                    Spacer()
                    
                    Button {
                        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                           let window = scene.windows.first {
                            window.rootViewController = UIHostingController(rootView: TabbarView(selectedTab: .home, isDriverInfoOpen: true, detail: detail))
                        }
                    } label: {
                        Text("Confirm Ride")
                            .frame(maxWidth: .infinity)
                            .font(Font.custom(poppinsMedium, size: 16))
                            .padding()
                            .background(themePrimaryGreenColor)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .padding(.horizontal, 16)
                    }
                    .padding(.bottom, 6)
                }
                .padding(.bottom, 12)
                .navigationBarHidden(true)
            }
        }
    }
}

#Preview {
    ThankYouView(selectedLocationData: .constant(""), currentLocationData: .constant(""), detail: CarModel(name: "BMW Cabrio", carImage: "ic_bmw_cabrio", type: "Automatic", seat: "3 seats", fuleType: "Octane", distation: "800m (5mins away)"))
}
