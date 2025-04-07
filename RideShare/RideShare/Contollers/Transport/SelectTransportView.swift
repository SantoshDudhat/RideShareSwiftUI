//
//  SelectTransportView.swift
//  RideShare
//
//  Created by DREAMWORLD on 26/12/24.
//

import SwiftUI

struct SelectTransportView: View {
    
    @Binding var selectedLocationData: String?
    @Binding var currentLocationData: String?
    
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedTransport: Transport? = nil
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
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
                    Text("Select transport")
                        .foregroundColor(.black)
                        .font(.custom(poppinsMedium, size: 19))
                }
                .padding(.horizontal, 16)
                
                Spacer()
                
                ScrollView {
                    
                    Spacer()
                    
                    VStack {
                        
                        Text("Select your transport")
                            .font(Font.custom(poppinsMedium, size: 24))
                            .foregroundColor(Color.hex("5A5A5A"))
                        
                        Spacer()
                        
                        LazyVGrid(columns: columns, spacing: 30) {
                            ForEach(arrTransport) { transport in
                                NavigationLink(destination: destinationView(for: transport)) {
                                    VStack {
                                        Image(transport.imageName)
                                            .resizable()
                                            .frame(width: 74, height: 74)
                                            .foregroundColor(.blue)
                                        
                                        Text(transport.name)
                                            .font(.custom(poppinsMedium, size: 16))
                                            .foregroundColor(Color.hex("5A5A5A"))
                                    }
                                    .frame(width: 160, height: 160)
                                    .background(themePrimaryLightGreenColor)
                                    .cornerRadius(8)
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(themePrimaryGreenColor, lineWidth: 1)
                                    }
                                }
                            }
                        }
                        .padding()
                    }
                }
                .scrollIndicators(.hidden)
            }
            .padding(.bottom, 12)
            .navigationBarHidden(true)
        }
    }
    @ViewBuilder
    func destinationView(for transport: Transport) -> some View {
        switch transport.name {
        case "Car":
            SelecteAvailableCarView(selectedLocationData: $selectedLocationData, currentLocationData: $currentLocationData)
        case "Bike":
            EmptyView()
        case "Cycle":
            EmptyView()
        case "Taxi":
            EmptyView()
        default:
            EmptyView()
        }
    }
}

#Preview {
    SelectTransportView(selectedLocationData: .constant(""), currentLocationData: .constant(""))
}
