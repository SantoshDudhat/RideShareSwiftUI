//
//  WalletView.swift
//  RideShare
//
//  Created by DREAMWORLD on 20/12/24.
//

import SwiftUI

struct WalletView: View {
    @State private var isNavigating: Bool = false
    var transactionList = [
        Transactions(name: "Wafaoner", date: "Today at 9:20 am", amount: "-$789.00", isReceived: false),
        Transactions(name: "Adsa", date: "Today at 9:10 am", amount: "$789.00", isReceived: true),
        Transactions(name: "dasd", date: "Today at 9:50 am", amount: "$789.00", isReceived: true),
        Transactions(name: "dasdasd", date: "Today at 9:40 am", amount: "-$789.00", isReceived: false),
        Transactions(name: "saddas", date: "Today at 9:22 am", amount: "$789.00", isReceived: true),
        Transactions(name: "tertret", date: "Today at 1:28 am", amount: "-$289.00", isReceived: false),
        Transactions(name: "tertgdff", date: "Today at 10:23 am", amount: "-$9.00", isReceived: false),
        Transactions(name: "gfdhgb", date: "Today at 9:20 am", amount: "$79.00", isReceived: true),
        Transactions(name: "bvcbc", date: "Today at 4:20 am", amount: "-$8.00", isReceived: false),
        Transactions(name: "ljljklkjl", date: "Today at 5:20 am", amount: "$89.00", isReceived: true),
        Transactions(name: "wewwrwer", date: "Today at 9:50 am", amount: "-$79.00", isReceived: false),
        Transactions(name: "asddsa", date: "Today at 6:20 am", amount: "$7.00", isReceived: true)
    ]
    @Binding var isSideMenuOpen: Bool

    var body: some View {
        NavigationStack {
            VStack {
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
                    
                    Button(action: {
                        print("Notification button tapped")
                        isNavigating = true
                    }) {
                        Image("ic_notification")
                            .resizable()
                            .frame(width: 40, height: 40)
                    }
                    .navigationDestination(isPresented: $isNavigating, destination: {
                        NotificationView()
                    })
                    .padding(.trailing, 16)
                }
                .padding(.top, 44)
                
                ScrollView {
                    VStack {
                        HStack {
                            Spacer()
                            
                            NavigationLink(destination: AddAmountView()) {
                                Text("Add Money")
                                    .frame(width: 170, height: 28)
                                    .font(Font.custom(poppinsMedium, size: 16))
                                    .foregroundColor(themePrimaryGreenColor)
                                    .padding()
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(themePrimaryGreenColor, lineWidth: 1)
                                    }
                            }
                            
//                            Button(action: {
//                                isNavigating = true
//                            }, label: {
//                                Text("Add Money")
//                                    .frame(width: 170, height: 28)
//                                    .font(Font.custom(poppinsMedium, size: 16))
//                                    .foregroundColor(themePrimaryGreenColor)
//                                    .padding()
//                                    .overlay {
//                                        RoundedRectangle(cornerRadius: 8)
//                                            .stroke(themePrimaryGreenColor, lineWidth: 1)
//                                    }
//                                
//                            })
//                            .navigationDestination(isPresented: $isNavigating, destination: {
//                                AddAmountView()
//                            })
                        }
                        
                        HStack(spacing: 16) {
                            VStack {
                                Text("$500")
                                    .font(Font.custom(poppinsMedium, size: 28))
                                    .foregroundColor(.black)
                                Text("Available Balance")
                                    .font(Font.custom(poppinsMedium, size: 14))
                                    .foregroundColor(.black)
                            }
                            .padding()
                            .frame(maxWidth: UIScreen.main.bounds.width / 2 - 24)
                            .frame(height: 145)
                            .background(themePrimaryLightGreenColor)
                            .overlay {
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(themeGreenColor, lineWidth: 1)
                            }
                            
                            VStack {
                                Text("$200")
                                    .font(Font.custom(poppinsMedium, size: 28))
                                    .foregroundColor(.black)
                                Text("Total Expend")
                                    .font(Font.custom(poppinsMedium, size: 14))
                                    .foregroundColor(.black)
                            }
                            .padding()
                            .frame(maxWidth: UIScreen.main.bounds.width / 2 - 24)
                            .frame(height: 145)
                            .background(themePrimaryLightGreenColor)
                            .overlay {
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(themeGreenColor, lineWidth: 1)
                            }
                        }
                        .padding(.top, 16)
                        
                        HStack {
                            Text("Transactions")
                                .font(Font.custom(poppinsSemiBold, size: 16))
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            Button(action: {
                                
                            }, label: {
                                Text("See All")
                                    .font(Font.custom(poppinsMedium, size: 12))
                                    .foregroundColor(themePrimaryGreenColor)
                            })
                        }
                        .padding(.top, 16)
                    }
                    .padding(.top, 24)
                    .padding(.horizontal, 16)
                    
                    VStack {
                        ForEach(transactionList, id: \.id) { objTransaction in
                            WalletTransactionView(objTransaction: objTransaction)
                                .listRowSeparator(.hidden)
                        }
                    }
                    .padding(.top, 16)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 16)
                }
                .scrollIndicators(.hidden)
            }
            .padding(.bottom, UIScreen.main.bounds.height / 9 / 1.3)
            Spacer()
        }
    }
}

#Preview {
    WalletView(isSideMenuOpen: .constant(false))
}
