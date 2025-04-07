//
//  DropDownView.swift
//  RideShare
//
//  Created by DREAMWORLD on 26/12/24.
//

import Foundation

import SwiftUI
import DropDown

struct DropDownWrapper: UIViewRepresentable {
    @State var selectedOption: (String)->Void
    let options: [String]

    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: CGRect(x: 16, y: 44, width: UIScreen.main.bounds.width - 32, height: 44))
        let dropDown = DropDown()

        // Configure DropDown
        dropDown.anchorView = view
        dropDown.dataSource = options
        dropDown.direction = .any

        // Handle Selection
        dropDown.selectionAction = { (index: Int, item: String) in
            selectedOption(item)
        }

        // Show DropDown when tapped
        DispatchQueue.main.async {
            dropDown.show()
        }

        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        // Nothing to update for DropDown
    }
}

struct TextViewWrapper: UIViewRepresentable {
    @Binding var text: String
    let placeholder: String
    let characterLimit: Int

    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.delegate = context.coordinator
        textView.text = placeholder
        textView.textColor = UIColor(Color.hex("D0D0D0"))
        textView.font = UIFont(name: poppinsMedium, size: 16)
        textView.layer.borderColor = textFieldGrayBoarder.cgColor
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 8
        textView.textContainerInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        return textView
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        if text.isEmpty && !uiView.isFirstResponder {
            uiView.text = placeholder
            uiView.textColor = UIColor(Color.hex("D0D0D0"))
        } else if uiView.text == placeholder && uiView.isFirstResponder {
            uiView.text = ""
            uiView.textColor = .black
        } else if uiView.text != text {
            uiView.text = text
            uiView.textColor = .black
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UITextViewDelegate {
        var parent: TextViewWrapper

        init(_ parent: TextViewWrapper) {
            self.parent = parent
        }

        func textViewDidBeginEditing(_ textView: UITextView) {
            if textView.text == parent.placeholder {
                textView.text = ""
                textView.textColor = .black
            }
        }

        func textViewDidEndEditing(_ textView: UITextView) {
            if textView.text.isEmpty {
                textView.text = parent.placeholder
                textView.textColor = UIColor(Color.hex("D0D0D0"))
            }
        }

        func textViewDidChange(_ textView: UITextView) {
            if textView.text.count <= parent.characterLimit {
                parent.text = textView.text
            } else {
                textView.text = String(textView.text.prefix(parent.characterLimit))
                parent.text = textView.text
            }
        }
    }
}
