//
//  AddBankDetailsView.swift
//  RideShare
//
//  Created by DREAMWORLD on 25/12/24.
//

import SwiftUI

struct AddBankDetailsView: View {
    
    @State private var selectePaymentNumber: String = ""
    @State private var accountNumber: String = ""
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
                    Text("Amount")
                        .foregroundColor(.black)
                        .font(.custom(poppinsMedium, size: 19))
                }
                .padding(.horizontal, 16)
                
                Spacer()
                
                ScrollView {
                    
                    Spacer()
                    VStack(spacing: 24) {
                        VStack(spacing: 16) {
                            TextField("Select Payment Method", text: $selectePaymentNumber)
                                .font(Font.custom(poppinsMedium, size: 16))
                                .frame(height: 60)
                                .padding(.vertical, 4)
                                .background(Color.clear)
                                .padding(.horizontal, 16)
                                .foregroundColor(.black)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(textFieldGrayBoarder, lineWidth: 1)
                                )
                            
                            TextField("Account Number", text: $accountNumber)
                                .font(Font.custom(poppinsMedium, size: 16))
                                .frame(height: 60)
                                .padding(.vertical, 4)
                                .background(Color.clear)
                                .padding(.horizontal, 16)
                                .foregroundColor(.black)
                                .keyboardType(.numberPad)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(textFieldGrayBoarder, lineWidth: 1)
                                )
                        }
                        
                        Button(action: {
                            if selectePaymentNumber != "" && accountNumber != "" {
                                arrPaymentMethod.append(PaymentMethod(iconName: "ic_mastercard", title: accountNumber, subtitle: selectePaymentNumber))
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                    presentationMode.wrappedValue.dismiss()
                                }
                            } else {
                                print("Fields are empty.")
                            }
                            
                        }, label: {
                            Text("Save Payment Method")
                                .frame(maxWidth: .infinity)
                                .font(Font.custom(poppinsMedium, size: 16))
                                .padding()
                                .background((selectePaymentNumber.isEmpty || accountNumber.isEmpty) ? themePrimaryGreenColor.opacity(0.2) : themePrimaryGreenColor)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                                .padding(.horizontal, 16)
                        })
                        .disabled(selectePaymentNumber.isEmpty || accountNumber.isEmpty)
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 10)
                    
                    Spacer(minLength: 30)
                    
                    VStack {
                        ForEach(arrPaymentMethod.indices, id: \.self) { index in
                            Button(action: {
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
                                .background(themePrimaryGreenColor.opacity(0.2))
                                .cornerRadius(4)
                                .disabled(true)
                                .opacity(0.4)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 4)
                                        .stroke(themeGreenColor.opacity(0.2), lineWidth: 1)
                                )
                                
                            })
                        }
                        .padding(.horizontal, 16)
                    }
                }
                .scrollIndicators(.hidden)
            }
            .padding(.bottom, 12)
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    AddBankDetailsView()
}
