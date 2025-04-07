//
//  View+Extension.swift
//  PlantaApp
//
//  Created by DREAMWORLD on 02/12/24.
//

import Foundation
import SwiftUI

struct CustomCornerRadiusShape: Shape {
    var radius: CGFloat
    var corners: UIRectCorner

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(CustomCornerRadiusShape(radius: radius, corners: corners))
    }
}

extension UIImage {
    convenience init(color: UIColor) {
        let rect = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width / 3 - 32, height: 30)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()!
        context.setFillColor(color.cgColor)
        context.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.init(cgImage: image!.cgImage!)
    }
}

struct StatusBarStyleModifier: UIViewControllerRepresentable {
    var style: UIStatusBarStyle

    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .clear
        viewController.view.isUserInteractionEnabled = false
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        uiViewController.overrideUserInterfaceStyle = style == .lightContent ? .dark : .light
    }
}

extension View {
    func statusBarStyle(_ style: UIStatusBarStyle) -> some View {
        self.background(
            StatusBarStyleModifier(style: style)
                .edgesIgnoringSafeArea(.all)
        )
    }
}
