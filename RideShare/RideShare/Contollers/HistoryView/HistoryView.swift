//
//  HistoryView.swift
//  RideShare
//
//  Created by DREAMWORLD on 24/12/24.
//

import SwiftUI

enum HistorySection: String {
    case upcoming = "Upcoming"
    case completed = "Completed"
    case cancelled = "Cancelled"
}


struct HistoryView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedOption: HistorySection = .upcoming

    var historyList = [
        Transactions(name: "Wafaoner", date: "Today at 9:20 am", amount: "Mustang Shelby GT", isReceived: false),
        Transactions(name: "Wafaoner", date: "Tommorrow at 9:20 am", amount: "Mustang Shelby GT", isReceived: false),
        Transactions(name: "Wafaoner", date: "Today at 9:20 am", amount: "Mustang Shelby GT", isReceived: false),
        Transactions(name: "Adsa", date: "Tommorrow at 9:10 am", amount: "Mustang Shelby GT", isReceived: true),
        Transactions(name: "dasd", date: "Today at 9:50 am", amount: "Mustang Shelby GT", isReceived: true),
        Transactions(name: "dasdasd", date: "Tommorrow at 9:40 am", amount: "Mustang Shelby GT", isReceived: false),
        Transactions(name: "saddas", date: "Today at 9:22 am", amount: "Mustang Shelby GT", isReceived: true),
        Transactions(name: "tertret", date: "Tommorrow at 1:28 am", amount: "Mustang Shelby GT", isReceived: false),
        Transactions(name: "tertgdff", date: "Tommorrow at 10:23 am", amount: "Mustang Shelby GT", isReceived: false),
        Transactions(name: "gfdhgb", date: "Today at 9:20 am", amount: "Mustang Shelby GT", isReceived: true),
        Transactions(name: "bvcbc", date: "Tommorrow at 4:20 am", amount: "Mustang Shelby GT", isReceived: false),
        Transactions(name: "ljljklkjl", date: "Today at 5:20 am", amount: "Mustang Shelby GT", isReceived: true),
        Transactions(name: "wewwrwer", date: "Tommorrow at 9:50 am", amount: "Mustang Shelby GT", isReceived: false),
        Transactions(name: "narte", date: "Tommorrow at 6:20 am", amount: "Mustang Shelby GT", isReceived: true),
        Transactions(name: "asddsa", date: "Today at 6:20 am", amount: "Mustang Shelby GT", isReceived: true),
        Transactions(name: "asddsa", date: "Tommorrow at 6:20 am", amount: "Mustang Shelby GT", isReceived: true)
    ]

    var body: some View {
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
                Text("History")
                    .foregroundColor(.black)
                    .font(.custom(poppinsMedium, size: 19))
            }
            .padding(.horizontal, 16)
            
            ScrollView {
                HStack(spacing: 0) {
                    Button(action: {
                        selectedOption = .upcoming
                    }) {
                        Text(HistorySection.upcoming.rawValue)
                            .font(Font.custom(poppinsMedium, size: 16))
                            .foregroundColor(selectedOption == .upcoming ? .white : .black)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(selectedOption == .upcoming ? themeGreenColor : Color.clear)
                            .cornerRadius(8)
                    }
                    
                    Button(action: {
                        selectedOption = .completed
                    }) {
                        Text(HistorySection.completed.rawValue)
                            .font(Font.custom(poppinsMedium, size: 16))
                            .foregroundColor(selectedOption == .completed ? .white : .black)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(selectedOption == .completed ? themeGreenColor : Color.clear)
                            .cornerRadius(8)
                    }
                    
                    Button(action: {
                        selectedOption = .cancelled
                    }) {
                        Text(HistorySection.cancelled.rawValue)
                            .font(Font.custom(poppinsMedium, size: 16))
                            .foregroundColor(selectedOption == .cancelled ? .white : .black)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(selectedOption == .cancelled ? themeGreenColor : Color.clear)
                            .cornerRadius(8)
                    }
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(themeGreenColor, lineWidth: 2)
                }
                .background(themePrimaryLightGreenColor)
                .cornerRadius(8)
                .padding(.bottom, 12)
                .padding(.top, 24)
                .padding(.horizontal, 16)
                
                VStack {
                    ForEach(historyList, id: \.id) { history in
                        CellHistory(objTransaction: history, selectedOption: selectedOption)
                            .padding(.bottom, 8)
                    }
                }
                .padding(.horizontal, 16)
            }
            .scrollIndicators(.hidden)
            Spacer()
        }
        .background(.white)
        .navigationBarHidden(true)
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    HistoryView()
}
