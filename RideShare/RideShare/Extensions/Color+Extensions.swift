//
//  Color+Extensions.swift
//  PlantaApp
//
//  Created by DREAMWORLD on 02/12/24.
//

import Foundation
import SwiftUI

// MARK: - Color Extensions
extension Color {
    /// Create a Color using RGB values
    static func rgb(_ red: Int, _ green: Int, _ blue: Int, opacity: Double = 1.0) -> Color {
        return Color(
            .sRGB,
            red: Double(red) / 255.0,
            green: Double(green) / 255.0,
            blue: Double(blue) / 255.0,
            opacity: opacity
        )
    }

    /// Create a Color using a Hexadecimal string
    static func hex(_ hex: String, opacity: Double = 1.0) -> Color {
        var trimmedString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if trimmedString.hasPrefix("#") {
            trimmedString.remove(at: trimmedString.startIndex)
        }
        
        guard trimmedString.count == 6 else {
            return Color.gray
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: trimmedString).scanHexInt64(&rgbValue)
        
        return Color(
            .sRGB,
            red: Double((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: Double((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: Double(rgbValue & 0x0000FF) / 255.0,
            opacity: opacity
        )
    }
}
