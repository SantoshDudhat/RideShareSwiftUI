//
//  SideMenuEnum.swift
//  RideShare
//
//  Created by DREAMWORLD on 23/12/24.
//

import Foundation

enum SideMenuOptions: CaseIterable {
    case history
    case complain
    case referral
    case aboutUs
    case settings
    case helpAndSupport
    case logout
    
    var key: String {
        switch self {
        case .history:
            return "History"
        case .complain:
            return "Complain"
        case .referral:
            return "Referral"
        case .aboutUs:
            return "About Us"
        case .settings:
            return "Settings"
        case .helpAndSupport:
            return "Help and Support"
        case .logout:
            return "Logout"
        }
    }
    
    var image: String {
        switch self {
        case .history:
            return "ic_history"
        case .complain:
            return "ic_complain"
        case .referral:
            return "ic_referral"
        case .aboutUs:
            return "ic_aboutUs"
        case .settings:
            return "ic_settings"
        case .helpAndSupport:
            return "ic_helpAndSupport"
        case .logout:
            return "ic_logout"
        }
    }
}
