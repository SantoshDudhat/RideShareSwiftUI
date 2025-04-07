//
//  OfferView.swift
//  RideShare
//
//  Created by DREAMWORLD on 20/12/24.
//

import SwiftUI

struct Offer {
    var id = UUID()
    var offerRate: String
    var salerName: String
}

struct OfferView: View {
    
    @Binding var isSideMenuOpen: Bool
    @State private var isNavigating: Bool = false
    
    var arrOffer = [
        Offer(offerRate: "15% off", salerName: "Black Friday"),
        Offer(offerRate: "5% off", salerName: "Crismus"),
        Offer(offerRate: "15% off", salerName: "Happy New Year"),
        Offer(offerRate: "15% off", salerName: "Black Friday"),
        Offer(offerRate: "5% off", salerName: "Crismus"),
        Offer(offerRate: "15% off", salerName: "Happy New Year"),
        Offer(offerRate: "15% off", salerName: "Black Friday"),
        Offer(offerRate: "5% off", salerName: "Crismus"),
        Offer(offerRate: "15% off", salerName: "Happy New Year"),
        Offer(offerRate: "15% off", salerName: "Black Friday"),
        Offer(offerRate: "5% off", salerName: "Crismus"),
        Offer(offerRate: "15% off", salerName: "Happy New Year")
    ]
    
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
                Text("Offer")
                    .foregroundColor(.black)
                    .font(.custom(poppinsMedium, size: 19))
            }
            Spacer()
            
            List(arrOffer, id: \.id) { offer in
                HStack {
                    VStack(alignment: .leading, spacing: 6) {
                        Text(offer.offerRate)
                            .foregroundColor(Color.hex("F57F17"))
                            .font(.custom(poppinsMedium, size: 16))
                        
                        Text(offer.salerName)
                            .font(.custom(poppinsRegular, size: 12))
                    }
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        Text("Collect")
                            .font(.custom(poppinsMedium, size: 16))
                            .foregroundColor(.white)
                            .frame(width: 117, height: 43)
                    })
                    .background(themePrimaryGreenColor)
                    .cornerRadius(6)
                    .buttonStyle(PlainButtonStyle())
                }
                .padding()
                .overlay(content: {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(lineWidth: 1)
                        .foregroundColor(themeLightGreenColor)
                })
                .listRowSeparator(.hidden, edges: .all)
            }
            .scrollIndicators(.hidden)
            .padding(.top, 16)
            .listStyle(PlainListStyle())
            .background(.white)
            Spacer()
        }
        .padding(.top, 44)
        .padding(.bottom, UIScreen.main.bounds.height / 9 / 1.3)
    }
}

#Preview {
    OfferView(isSideMenuOpen: .constant(false))
}
