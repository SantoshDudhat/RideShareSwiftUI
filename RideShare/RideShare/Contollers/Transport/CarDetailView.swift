//
//  CarDetailView.swift
//  RideShare
//
//  Created by DREAMWORLD on 26/12/24.
//

import SwiftUI

struct CarDetailView: View {
    
    @Binding var selectedLocationData: String?
    @Binding var currentLocationData: String?
    
    @Environment(\.presentationMode) var presentationMode
    let detail: CarModel
    
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
                    
                    Spacer(minLength: 30)
                    
                    VStack {
                        HStack {
                            Text(detail.name)
                                .font(.custom(poppinsMedium, size: 24))
                                .foregroundColor(Color.hex("5A5A5A"))
                            Spacer()
                        }
                        
                        HStack {
                            Image("ic_star")
                            Text("4.9 (531 reviews)")
                                .font(.custom(poppinsMedium, size: 14))
                                .foregroundColor(Color.hex("B8B8B8"))
                            Spacer()
                        }
                        .padding(.top, -9)
                        
                        Image(detail.carImage)
                            .resizable()
                            .frame(width: 269, height: 156)
                            .padding(.top, 30)
                        
                        VStack {
                            HStack {
                                Text("Specifications")
                                    .font(.custom(poppinsMedium, size: 18))
                                    .foregroundColor(Color.hex("5A5A5A"))
                                Spacer()
                            }
                            HStack {
                                ForEach(arrSpecification.indices, id: \.self) { index in
                                    VStack {
                                        Image(arrSpecification[index].image)
                                        
                                        Text(arrSpecification[index].name)
                                            .font(.custom(poppinsMedium, size: 10))
                                            .foregroundColor(Color.hex("5A5A5A"))
                                            .multilineTextAlignment(.center)
                                            .frame(maxWidth: .infinity)
                                            .lineLimit(2)
                                            .minimumScaleFactor(0.5)
                                            .truncationMode(.tail)
                                        
                                        Text(arrSpecification[index].subTitle)
                                            .font(.custom(poppinsRegular, size: 8))
                                            .foregroundColor(Color.hex("5A5A5A"))
                                            .lineLimit(2)
                                            .minimumScaleFactor(0.5)
                                            .truncationMode(.tail)
                                    }
                                    .padding()
                                    .frame(width: UIScreen.main.bounds.width/4.5, height: UIScreen.main.bounds.width/4.5)
                                    .background(themePrimaryLightGreenColor)
                                    .cornerRadius(8)
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(themePrimaryGreenColor, lineWidth: 1)
                                    }
                                }
                            }
                        }
                        
                        Spacer(minLength: 30)
                        
                        VStack {
                            HStack {
                                Text("Car features")
                                    .font(.custom(poppinsMedium, size: 18))
                                    .foregroundColor(Color.hex("5A5A5A"))
                                Spacer()
                            }
                            
                            FeatureRow(label: "Model", value: "GT500")
                            FeatureRow(label: "Capacity", value: "760hp")
                            FeatureRow(label: "Color", value: "Red")
                            FeatureRow(label: "Fuel type", value: detail.fuleType)
                            FeatureRow(label: "Gear type", value: detail.type)
                        }
                        
                        Spacer(minLength: 30)
                        
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
                            
                            NavigationLink(destination: RequestForRentView(selectedLocationData: $selectedLocationData, currentLocationData: $currentLocationData, detail: detail)) {
                                Text("Ride Now")
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(themePrimaryGreenColor)
                                    .cornerRadius(8)
                            }
                            .overlay {
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(themePrimaryGreenColor, lineWidth: 1)
                            }
                        }
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

#Preview {
    CarDetailView(selectedLocationData: .constant(""), currentLocationData: .constant(""), detail: CarModel(name: "BMW Cabrio", carImage: "ic_bmw_cabrio", type: "Automatic", seat: "3 seats", fuleType: "Octane", distation: "800m (5mins away)"))
}
