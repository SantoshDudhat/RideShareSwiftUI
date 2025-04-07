//
//  AvailableCarListView.swift
//  RideShare
//
//  Created by DREAMWORLD on 26/12/24.
//

import SwiftUI

struct AvailableCarListView: View {
    
    @Binding var selectedLocationData: String?
    @Binding var currentLocationData: String?
    
    @Environment(\.presentationMode) var presentationMode
    let transport: CarModel
    
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
                }
                .padding(.horizontal, 16)
                
                Spacer()
                
                ScrollView {
                    
                    Spacer(minLength: 20)
                    
                    VStack(alignment: .leading) {
                        
                        Text("Available cars for ride")
                            .font(Font.custom(poppinsMedium, size: 24))
                            .foregroundColor(Color.hex("5A5A5A"))
                        
                        Spacer()
                        
                        Text("18 cars found")
                            .font(Font.custom(poppinsMedium, size: 14))
                            .foregroundColor(Color.hex("B8B8B8"))
                    }
                    .padding(.horizontal, 20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer(minLength: 30)
                    
                    ForEach(5...10, id: \.self) { _ in
                        VStack {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(transport.name)
                                        .font(.custom(poppinsMedium, size: 16))
                                        .foregroundColor(Color.hex("5A5A5A"))
                                    
                                    Text("\(transport.type) | \(transport.seat) | \(transport.fuleType)")
                                        .font(.custom(poppinsMedium, size: 12))
                                        .foregroundColor(Color.hex("B8B8B8"))
                                    
                                    HStack {
                                        Image("ic_map_pin")
                                            .resizable()
                                            .frame(width: 16, height: 16)
                                        Text(transport.distation)
                                            .font(.custom(poppinsMedium, size: 12))
                                            .foregroundColor(Color.hex("414141"))
                                    }
                                    .padding(.top, -7)
                                }
                                Spacer()
                                
                                Image(transport.carImage)
                            }
                            
                            Spacer(minLength: 24)
                            
                            HStack {
                                Button(action: {
                                    presentationMode.wrappedValue.dismiss()
                                }, label: {
                                    Text("Book later")
                                        .frame(maxWidth: .infinity)
                                        .foregroundColor(themePrimaryGreenColor)
                                        .padding()
                                })
                                .overlay {
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(themePrimaryGreenColor, lineWidth: 1)
                                }
                                
                                NavigationLink(destination: CarDetailView(selectedLocationData: $selectedLocationData, currentLocationData: $currentLocationData, detail: transport)) {
                                    Text("Ride Now")
                                        .frame(maxWidth: .infinity)
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(themePrimaryGreenColor)
                                        .cornerRadius(8)
                                }
                            }
                        }
                        .padding()
                        .cornerRadius(8)
                        .background(themePrimaryLightGreenColor)
                        .overlay {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(themePrimaryGreenColor, lineWidth: 1)
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 9)
                }
                .scrollIndicators(.hidden)
            }
            .padding(.bottom, 12)
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    AvailableCarListView(selectedLocationData: .constant(""), currentLocationData: .constant(""), transport: CarModel(name: "BMW Cabrio", carImage: "ic_bmw_cabrio", type: "Automatic", seat: "3 seats", fuleType: "Octane", distation: "800m (5mins away)"))
}
