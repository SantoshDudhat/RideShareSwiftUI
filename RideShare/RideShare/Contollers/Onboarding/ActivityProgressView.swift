//
//  ActivityProgressView.swift
//  RideShare
//
//  Created by DREAMWORLD on 16/12/24.
//

import Foundation
import SwiftUI

struct ActivityProgressView: View {
    let color: Color
    let backgroundColor: Color
    let progress: CGFloat
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(lineWidth: 4)
                .foregroundStyle(backgroundColor)
            
            Circle()
                .trim(from: 0.0, to: progress)
                .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round))
                .foregroundStyle(color)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear, value: progress)
        }
    }
}
