//
//  SelectLocationView.swift
//  RideShare
//
//  Created by DREAMWORLD on 27/12/24.
//

import SwiftUI

struct SelectLocationView: View {
    
    @Binding var selectedLocationData: String?
    @Binding var currentLocationData: String?
    @Binding var isModalDismissed: Bool
    
    @State private var currentLocation: String = ""
    @State private var destinationLocation: String = ""
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
                                isModalDismissed = true
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
                                            isModalDismissed = true
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
                            
                            VStack {
                                HStack {
                                    Spacer()
                                    Image("ic_current_location")
                                    TextField("From", text: $currentLocation)
                                        .font(Font.custom(poppinsMedium, size: 16))
                                        .padding(.vertical, 10)
                                        .background(Color.clear)
                                        .padding(.horizontal, 16)
                                }
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
                                    Spacer()
                                    Image("ic_current_location")
                                    TextField("To", text: $destinationLocation)
                                        .font(Font.custom(poppinsMedium, size: 16))
                                        .padding(.vertical, 10)
                                        .background(Color.clear)
                                        .padding(.horizontal, 16)
                                }
                            }
                            .frame(height: 60)
                            .padding(.horizontal, 16)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(textFieldGrayBoarder, lineWidth: 1)
                                    .padding(.horizontal, 16)
                            )
                            
                            Capsule()
                                .frame(maxWidth: .infinity, maxHeight: 1)
                                .foregroundColor(Color.hex("DDDDDD"))
                            
                            VStack(alignment: .leading, spacing: 12) {
                                Text("Recent places")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(Font.custom(poppinsMedium, size: 16))
                                    .foregroundColor(Color.hex("5A5A5A"))
                                    .padding(.horizontal)
                                
                                ForEach(arrRecentPlace, id: \.self) { place in
                                    HStack {
                                        Image("ic_map_pin")
                                        VStack(alignment: .leading) {
                                            HStack {
                                                Text(place.name)
                                                    .font(Font.custom(poppinsMedium, size: 16))
                                                    .foregroundColor(Color.hex("5A5A5A"))
                                                Spacer()
                                                Text("\(place.distance, specifier: "%.1f")km")
                                                    .font(Font.custom(poppinsMedium, size: 14))
                                                    .foregroundColor(Color.hex("5A5A5A"))
                                            }
                                            Text(place.address)
                                                .font(Font.custom(poppinsRegular, size: 12))
                                                .foregroundColor(Color.hex("B8B8B8"))
                                        }
                                    }
                                    .padding(.horizontal, 16)
                                    .onTapGesture {
                                        destinationLocation = place.address
                                    }
                                }
                            }
                            
                            Button {
                                if !currentLocation.isEmpty && !destinationLocation.isEmpty {
                                    selectedLocationData = destinationLocation
                                    currentLocationData = currentLocation
                                    isModalVisible = false
                                    isModalDismissed = false
                                    presentationMode.wrappedValue.dismiss()
                                }
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
                            .padding(.bottom, 6)
                            .disabled(currentLocation.isEmpty || destinationLocation.isEmpty)
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

struct BackgroundClearView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}

#Preview {
    SelectLocationView(selectedLocationData: .constant(""), currentLocationData: .constant(""), isModalDismissed: .constant(false))
}
