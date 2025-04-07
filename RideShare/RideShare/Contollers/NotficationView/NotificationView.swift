//
//  NotificationView.swift
//  RideShare
//
//  Created by DREAMWORLD on 20/12/24.
//

import SwiftUI

struct NotificationView: View {
    @StateObject private var viewModel = NotificationViewModel()
    @Environment(\.presentationMode) var presentationMode

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
                Text("Notification")
                    .foregroundColor(.black)
                    .font(.custom(poppinsMedium, size: 19))
            }
            .padding(.horizontal, 16)
            
            Spacer()
            
            ScrollView {
                VStack(alignment: .leading) {
                    if !viewModel.todayNotifications.isEmpty {
                        SectionHeader(title: "Today")
                        ForEach(viewModel.todayNotifications) { notification in
                            NotificationRow(notification: notification)
                        }
                    }
                    
                    if !viewModel.yesterdayNotifications.isEmpty {
                        SectionHeader(title: "Yesterday")
                        ForEach(viewModel.yesterdayNotifications) { notification in
                            NotificationRow(notification: notification)
                        }
                    }
                    
                    if !viewModel.lastWeekNotifications.isEmpty {
                        SectionHeader(title: "Last Week")
                        ForEach(viewModel.lastWeekNotifications) { notification in
                            NotificationRow(notification: notification)
                        }
                    }
                }
                .padding()
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    NotificationView()
}

struct SectionHeader: View {
    var title: String

    var body: some View {
        Text(title)
            .font(.custom(poppinsMedium, size: 14))
            .padding(.vertical, 10)
    }
}

struct NotificationRow: View {
    var notification: Notification

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(notification.paymentTitle)
                .font(.custom(poppinsMedium, size: 16))
            Text(notification.paymentDescription)
                .font(.custom(poppinsRegular, size: 12))
                .foregroundColor(.gray)
            Text(notification.time, style: .relative)
                .font(.custom(poppinsRegular, size: 12))
                .foregroundColor(.secondary)
        }
        .padding()
        .background(notification.highlighted ? Color(.systemMint).opacity(0.2) : Color.white)
        .cornerRadius(8)
    }
}
