//
//  AddAmountView.swift
//  RideShare
//
//  Created by DREAMWORLD on 24/12/24.
//

import SwiftUI

struct AddAmountView: View {
    
    @State private var amount: String = ""
    @State private var selectedMethod: Int? = nil
    @State private var isNavigation: Bool = false
    @State private var showOverlay: Bool = false
    @State private var sideMenu: Bool = false
    @FocusState private var isAmountFieldFocused: Bool
    @Environment(\.presentationMode) var presentationMode
    
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
                        Text("Amount")
                            .foregroundColor(.black)
                            .font(.custom(poppinsMedium, size: 19))
                    }
                    .padding(.horizontal, 16)
                    
                    Spacer()
                    
                    ScrollView {
                        
                        Spacer()
                        VStack {
                            TextField("Enter Amount", text: $amount)
                                .font(Font.custom(poppinsMedium, size: 16))
                                .padding(.vertical, 10)
                                .background(Color.clear)
                                .padding(.horizontal, 16)
                                .foregroundColor(.black)
                                .keyboardType(.numberPad)
                                .focused($isAmountFieldFocused)
                        }
                        .frame(height: 60)
                        .padding(.horizontal, 16)
                        .padding(.top, 10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(textFieldGrayBoarder, lineWidth: 1)
                                .padding(.horizontal, 16)
                                .padding(.top, 10)
                        )
                        
                        HStack {
                            Spacer()
                            NavigationLink(destination: AddBankDetailsView()) {
                                Text("Add payment Method")
                                    .font(Font.custom(poppinsMedium, size: 14))
                                    .foregroundStyle(Color.hex("304FFE"))
                            }
                            
                        }
                        .padding(.horizontal, 16)
                        
                        Spacer(minLength: 30)
                        
                        VStack(spacing: 30) {
                            
                            HStack {
                                Text("Select Payment Mehtod")
                                    .font(Font.custom(poppinsMedium, size: 16))
                                
                                Spacer()
                            }
                            .padding(.horizontal, 16)
                            
                            VStack {
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
                                .padding(.horizontal, 16)
                            }
                        }
                    }
                    .gesture(
                        DragGesture()
                            .onChanged { _ in
                                if isAmountFieldFocused {
                                    isAmountFieldFocused = false
                                }
                            }
                    )
                    .scrollIndicators(.hidden)
                    
                    VStack {
                        Button {
                            print("Confirm")
                            if selectedMethod != nil && amount != "" {
                                isAmountFieldFocused = false
                                showOverlay = true
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
                    }
                    .padding(.bottom, 30)
                }
                .navigationBarHidden(true)
                if showOverlay {
                    Color.black.opacity(0.4)
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        HStack {
                            Spacer()
                            Button {
                                if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                                   let window = scene.windows.first {
                                    window.rootViewController = UIHostingController(rootView: TabbarView(selectedTab: .home))
                                    window.makeKeyAndVisible()
                                } else {
                                    presentationMode.wrappedValue.dismiss()
                                }
                            } label: {
                                Image("ic_close")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                            }
                        }
                        .padding(.top, 12)
                        .padding(.horizontal, 12)
                        
                        Image("ic_payment_success")
                            .resizable()
                            .frame(width: 124, height: 124)
                            .padding(.top, 12)
                        
                        Text("Add Success")
                            .font(Font.custom(poppinsMedium, size: 22))
                            .padding(.top, 16)
                        
                        Text("Your money has been add successfully")
                            .font(Font.custom(poppinsMedium, size: 12))
                            .foregroundColor(Color.hex("898989"))
                        
                        Text("Amount")
                            .font(Font.custom(poppinsMedium, size: 12))
                            .padding(.top, 16)
                        
                        Text("$\(amount)")
                            .font(Font.custom(poppinsRegular, size: 34))
                        
                        Button {
                            if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                               let window = scene.windows.first {
                                window.rootViewController = UIHostingController(rootView: TabbarView(selectedTab: .home))
                                window.makeKeyAndVisible()
                            } else {
                                presentationMode.wrappedValue.dismiss()
                            }
                        } label: {
                            Text("Back Home")
                                .frame(maxWidth: .infinity)
                                .font(Font.custom(poppinsMedium, size: 16))
                                .padding()
                                .background(themePrimaryGreenColor)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                                .padding(.horizontal, 16)
                        }
                        .padding(.bottom, 32)
                    }
                    .background(Color.white)
                    .cornerRadius(8)
                    .padding(.horizontal, 16)
                }
            }
        }
    }
}

#Preview {
    AddAmountView()
}
