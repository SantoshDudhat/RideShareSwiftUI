//
//  Notifications.swift
//  RideShare
//
//  Created by DREAMWORLD on 20/12/24.
//

import Foundation
import SwiftUI

struct Notification: Identifiable {
    var id = UUID()
    var paymentTitle: String
    var paymentDescription: String
    var time: Date
    var highlighted: Bool
}

class NotificationViewModel: ObservableObject {
    @Published var todayNotifications: [Notification] = []
    @Published var yesterdayNotifications: [Notification] = []
    @Published var lastWeekNotifications: [Notification] = []
    
    
    init() {
        generateNotifications()
    }
    
    func randomDate(for category: String) -> Date {
        let calendar = Calendar.current
        let now = Date()
        
        switch category {
        case "Today":
            let randomMinutesAgo = Int.random(in: 0...60 * 12)
            return calendar.date(byAdding: .minute, value: -randomMinutesAgo, to: now) ?? now
        case "Yesterday":
            if let yesterday = calendar.date(byAdding: .day, value: -1, to: now) {
                let randomMinutesAgo = Int.random(in: 0...(60 * 24))
                return calendar.date(byAdding: .minute, value: -randomMinutesAgo, to: yesterday) ?? yesterday
            }
        case "Last Week":
            let randomDaysAgo = Int.random(in: 2...7)
            if let randomDay = calendar.date(byAdding: .day, value: -randomDaysAgo, to: now) {
                let randomMinutesAgo = Int.random(in: 0...(60 * 24))
                return calendar.date(byAdding: .minute, value: -randomMinutesAgo, to: randomDay) ?? randomDay
            }
        default:
            return now
        }
        return now
    }
    
    func generateNotifications() {
        for _ in 0..<10 {
            let category = ["Today", "Yesterday", "Last Week"].randomElement() ?? "Today"
            let notification = Notification(
                paymentTitle: "Payment Confirm",
                paymentDescription: "Lorem ipsum dolor sit amet consectetur. Ultrices tincidunt eleifend vitae",
                time: randomDate(for: category),
                highlighted: Bool.random()
            )
            
            switch category {
            case "Today":
                todayNotifications.append(notification)
            case "Yesterday":
                yesterdayNotifications.append(notification)
            case "Last Week":
                lastWeekNotifications.append(notification)
            default:
                break
            }
        }
    }
}
