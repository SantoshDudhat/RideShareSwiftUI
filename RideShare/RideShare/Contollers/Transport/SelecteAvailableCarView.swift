//
//  SelecteAvailableCarView.swift
//  RideShare
//
//  Created by DREAMWORLD on 26/12/24.
//

import SwiftUI

struct SelecteAvailableCarView: View {
    
    @Binding var selectedLocationData: String?
    @Binding var currentLocationData: String?
    @Environment(\.presentationMode) var presentationMode
    
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
                    
                    ForEach(arrCarModel.indices, id: \.self) { index in
                        VStack {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(arrCarModel[index].name)
                                        .font(.custom(poppinsMedium, size: 16))
                                        .foregroundColor(Color.hex("5A5A5A"))
                                    
                                    Text("\(arrCarModel[index].type) | \(arrCarModel[index].seat) | \(arrCarModel[index].fuleType)")
                                        .font(.custom(poppinsMedium, size: 12))
                                        .foregroundColor(Color.hex("B8B8B8"))
                                    
                                    HStack {
                                        Image("ic_map_pin")
                                            .resizable()
                                            .frame(width: 16, height: 16)
                                        Text(arrCarModel[index].distation)
                                            .font(.custom(poppinsMedium, size: 12))
                                            .foregroundColor(Color.hex("414141"))
                                    }
                                    .padding(.top, -7)
                                }
                                Spacer()
                                
                                Image(arrCarModel[index].carImage)
                            }
                            
                            Spacer(minLength: 24)
                            
                            NavigationLink(destination: AvailableCarListView(selectedLocationData: $selectedLocationData, currentLocationData: $currentLocationData, transport: arrCarModel[index])) {
                                Text("View car list")
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(themePrimaryGreenColor)
                                    .padding()
                            }
                            .overlay {
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(themePrimaryGreenColor, lineWidth: 1)
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
    SelecteAvailableCarView(selectedLocationData: .constant(""), currentLocationData: .constant(""))
}
