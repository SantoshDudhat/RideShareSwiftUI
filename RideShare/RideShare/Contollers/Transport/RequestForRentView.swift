//
//  RequestForRentView.swift
//  RideShare
//
//  Created by DREAMWORLD on 26/12/24.
//

import SwiftUI

enum PickerType {
    case date
    case time
}

struct RequestForRentView: View {
    
    @Binding var selectedLocationData: String?
    @Binding var currentLocationData: String?
    
    @Environment(\.presentationMode) var presentationMode
    var detail: CarModel
    @State private var date: String = ""
    @State private var time: String = ""
    @State private var isTimePickerPresented: Bool = false
    @State private var selectedTime: Date = Date()
    @State private var selectedMethod: Int? = 0
    @State private var pickerType: PickerType = .date
    
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
                        
                        VStack {
                            TextField("Date", text: $date)
                                .font(Font.custom(poppinsMedium, size: 16))
                                .padding(.vertical, 10)
                                .background(Color.clear)
                                .padding(.horizontal, 16)
                                .onTapGesture {
                                    withAnimation {
                                        pickerType = .date
                                        isTimePickerPresented = true
                                    }
                                }
                        }
                        .frame(height: 60)
                        .padding(.top, 16)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(textFieldGrayBoarder, lineWidth: 1)
                                .padding(.top, 16)
                        )
                        .padding(.horizontal, 16)
                        
                        VStack {
                            TextField("Time", text: $time)
                                .font(Font.custom(poppinsMedium, size: 16))
                                .padding(.vertical, 10)
                                .background(Color.clear)
                                .padding(.horizontal, 16)
                                .onTapGesture {
                                    withAnimation {
                                        pickerType = .time
                                        isTimePickerPresented = true
                                    }
                                }
                        }
                        .frame(height: 60)
                        .padding(.top, 16)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(textFieldGrayBoarder, lineWidth: 1)
                                .padding(.top, 16)
                        )
                        .padding(.horizontal, 16)
                        
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
                            
                            NavigationLink(destination: RequestConfirmView(selectedLocationData: $selectedLocationData, currentLocationData: $currentLocationData, detail: detail)) {
                                Text("Confirm Booking")
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
                
                if isTimePickerPresented {
                    Color.black.opacity(0.3)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            isTimePickerPresented = false
                        }
                    
                    VStack {
                        Spacer()
                        VStack {
                            Text(pickerType == .date ? "Select Date" : "Select Time")
                                .font(Font.custom(poppinsMedium, size: 18))
                                .padding()
                            
                            DatePicker(
                                "Time",
                                selection: $selectedTime,
                                in: pickerType == .date ? Date()... : Date()...,
                                displayedComponents: pickerType == .date ? [.date] : [.hourAndMinute]
                            )
                            .datePickerStyle(WheelDatePickerStyle())
                            .labelsHidden()
                            
                            Button(action: {
                                let formatter = DateFormatter()
                                if pickerType == .date {
                                    formatter.dateStyle = .medium
                                    date = formatter.string(from: selectedTime)
                                } else {
                                    formatter.timeStyle = .short
                                    time = formatter.string(from: selectedTime)
                                }
                                isTimePickerPresented = false
                            }) {
                                Text("Done")
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(themePrimaryGreenColor)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                            .padding()
                        }
                        .background(Color.white)
                        .cornerRadius(16)
                        .shadow(radius: 10)
                        .transition(.move(edge: .bottom))
                    }
                    .edgesIgnoringSafeArea(.bottom)
                }
            }
        }
    }
}


#Preview {
    RequestForRentView(selectedLocationData: .constant(""), currentLocationData: .constant(""), detail: CarModel(name: "BMW Cabrio", carImage: "ic_bmw_cabrio", type: "Automatic", seat: "3 seats", fuleType: "Octane", distation: "800m (5mins away)"))
}
