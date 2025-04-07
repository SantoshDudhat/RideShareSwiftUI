//
//  RequestConfirmView.swift
//  RideShare
//
//  Created by DREAMWORLD on 26/12/24.
//

import SwiftUI

struct RequestConfirmView: View {
    
    @Binding var selectedLocationData: String?
    @Binding var currentLocationData: String?
    
    @Environment(\.presentationMode) var presentationMode
    var detail: CarModel
    @State private var selectedMethod: Int? = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
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
                        Text("Request for rent")
                            .font(Font.custom(poppinsMedium, size: 18))
                    }
                    .padding(.horizontal, 16)
                    
                    Spacer()
                    
                    ScrollView {
                        Spacer(minLength: 30)
                        
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
                        
                        Spacer(minLength: 30)
                        
                        VStack {
                            HStack {
                                VStack {
                                    Text(detail.name)
                                        .font(Font.custom(poppinsMedium, size: 16))
                                        .foregroundColor(Color.hex("5A5A5A"))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    HStack {
                                        Image("ic_star")
                                        Text("4.9 (531 reviews)")
                                            .font(.custom(poppinsMedium, size: 14))
                                            .foregroundColor(Color.hex("B8B8B8"))
                                        Spacer()
                                    }
                                    .padding(.top, -9)
                                }
                                Spacer()
                                
                                Image(detail.carImage)
                            }
                        }
                        .padding(6)
                        .background(themePrimaryLightGreenColor)
                        .cornerRadius(8)
                        .overlay {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(themePrimaryGreenColor, lineWidth: 1)
                        }
                        .padding(.horizontal, 16)
                        
                        Spacer(minLength: 30)
                        
                        VStack(spacing: 12) {
                          Text("Charge")
                                .font(Font.custom(poppinsMedium, size: 16))
                                .foregroundColor(Color.hex("5A5A5A"))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            VStack {
                                HStack {
                                    Text("Mustang/per hours")
                                        .font(Font.custom(poppinsRegular, size: 14))
                                        .foregroundColor(Color.hex("5A5A5A"))
                                    
                                    Spacer()
                                    
                                    Text("$200")
                                        .font(Font.custom(poppinsRegular, size: 14))
                                        .foregroundColor(Color.hex("5A5A5A"))
                                }
                                
                                HStack {
                                    Text("Vat (5%)")
                                        .font(Font.custom(poppinsRegular, size: 14))
                                        .foregroundColor(Color.hex("5A5A5A"))
                                    
                                    Spacer()
                                    
                                    Text("$20")
                                        .font(Font.custom(poppinsRegular, size: 14))
                                        .foregroundColor(Color.hex("5A5A5A"))
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Spacer(minLength: 30)
                        
                        VStack(spacing: 12) {
                            
                            HStack {
                                Text("Select Payment Mehtod")
                                    .font(Font.custom(poppinsMedium, size: 16))
                                
                                Spacer()
                            }
                            
                            ForEach(arrPaymentMethod.indices, id: \.self) { index in
                                Button(action: {
                                    selectedMethod = index
                                    print(index)
                                }, label: {
                                    HStack(spacing: 12) {
                                        Image(arrPaymentMethod[index].iconName)
                                            .resizable()
                                            .frame(width: 45, height: 35)
                                        
                                        VStack(alignment: .leading, spacing: 4) {
                                            Text(arrPaymentMethod[index].title)
                                                .font(Font.custom(poppinsMedium, size: 16))
                                                .foregroundColor(.black)
                                            
                                            Text(arrPaymentMethod[index].subtitle)
                                                .font(Font.custom(poppinsMedium, size: 14))
                                                .foregroundColor(Color.hex("B8B8B8"))
                                        }
                                        
                                        Spacer()
                                    }
                                    .padding()
                                    .background(selectedMethod == index ? themePrimaryGreenColor.opacity(0.3) : themePrimaryGreenColor.opacity(0.2))
                                    .cornerRadius(4)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 4)
                                            .stroke(selectedMethod == index ? themeGreenColor : themeGreenColor.opacity(0.3), lineWidth: 1)
                                    )
                                    
                                })
                            }
                            
                            NavigationLink(destination: ThankYouView(selectedLocationData: $selectedLocationData, currentLocationData: $currentLocationData, detail: detail)) {
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
                        .padding(.horizontal, 16)
                    }
                    .scrollIndicators(.hidden)
                }
                .padding(.bottom, 12)
                .navigationBarHidden(true)
            }
        }
    }
}

#Preview {
    RequestConfirmView(selectedLocationData: .constant(""), currentLocationData: .constant(""), detail: CarModel(name: "BMW Cabrio", carImage: "ic_bmw_cabrio", type: "Automatic", seat: "3 seats", fuleType: "Octane", distation: "800m (5mins away)"))
}
