//
//  MessageView.swift
//  RideShare
//
//  Created by DREAMWORLD on 27/12/24.
//

import SwiftUI

struct MessageView: View {
    @State private var messageText: String = ""
    @State private var messages: [Message] = [
        Message(id: 1, text: "Good Evening!", isSender: true, timestamp: "8:29 pm"),
        Message(id: 2, text: "Welcome to Car2go Customer Service", isSender: false, timestamp: "8:29 pm")
    ]
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            // Header
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
                Text("Chat")
                    .foregroundColor(.black)
                    .font(.custom(poppinsMedium, size: 18))
                
            }
            .padding(.horizontal, 16)

            // Messages List
            ScrollViewReader { proxy in
                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(messages) { message in
                            ChatBubble(message: message)
                                .id(message.id)
                        }
                    }
                    .padding(.top, 8)
                }
                .onChange(of: messages, { oldValue, newValue in
                    if let lastMessage = messages.last {
                        proxy.scrollTo(lastMessage.id, anchor: .bottom)
                    }
                })
            }
            
            // Message Input
            HStack(spacing: 8) {
                Button(action: {
                    
                }) {
                    Image("ic_chat_plus")
                }
                
                HStack {
                    TextField("Type your message", text: $messageText)
                        .font(Font.custom(poppinsMedium, size: 16))
                        .padding(.vertical, 10)
                        .background(Color.clear)
                        .padding(.leading, 16)
                    
                    Spacer()

                    Button {
                        
                    } label: {
                        Image("ic_emoji")
                    }
                    .padding(.trailing, 16)
                }
                .frame(height: 52)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(textFieldGrayBoarder, lineWidth: 1)
                )
                
                Button(action: sendMessage) {
                    Image("ic_send_msg")
                }
            }
            .padding()
        }
    }
    
    private func sendMessage() {
        guard !messageText.isEmpty else { return }
        let newMessage = Message(id: messages.count + 1, text: messageText, isSender: true, timestamp: "Just now")
        messages.append(newMessage)
        let userMessage = messageText // Capture the current message for reply generation
        messageText = ""
        
        // Simulate receiver reply after a delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            generateReply(for: userMessage)
        }
    }
    
    private func generateReply(for userMessage: String) {
        var replyText: String
        
        // Simple keyword-based response logic
        if userMessage.lowercased().contains("hello") {
            replyText = "Hi there! How can I assist you today?"
        } else if userMessage.lowercased().contains("help") {
            replyText = "Sure, please let me know what you need help with."
        } else if userMessage.lowercased().contains("price") {
            replyText = "Our pricing depends on the service you choose. Could you please specify?"
        } else {
            replyText = "Thank you for your message! We're here to assist you."
        }
        
        let autoReply = Message(
            id: messages.count + 1,
            text: replyText,
            isSender: false,
            timestamp: "Just now"
        )
        messages.append(autoReply)
    }
}

#Preview {
    MessageView()
}

struct ChatBubble: View {
    var message: Message
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 10) {
            if message.isSender {
                Spacer()
                VStack(alignment: .trailing, spacing: 5) {
                    Text(message.text)
                        .padding()
                        .background(themePrimaryLightGreenColor)
                        .font(Font.custom(poppinsRegular, size: 14))
                        .cornerRadius(16, corners: [.topLeft, .bottomLeft, .bottomRight])
                        .overlay(
                            CustomCornerRadiusShape(radius: 16, corners: [.topLeft, .bottomLeft, .bottomRight])
                                .stroke(themeGreenColor, lineWidth: 1)
                        )
                        .foregroundColor(.black)
                    
                    Text(message.timestamp)
                        .font(Font.custom(poppinsRegular, size: 12))
                        .foregroundColor(Color.hex("717171"))
                }
            } else {
                HStack {
                    Image("img_profile")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .overlay {
                            Circle()
                                .stroke(themeGreenColor, lineWidth: 1)
                        }
                    VStack(alignment: .leading, spacing: 5) {
                        Text(message.text)
                            .padding()
                            .background(Color.hex("E8E8E8"))
                            .cornerRadius(16, corners: [.bottomLeft, .topRight, .bottomRight])
                            .font(Font.custom(poppinsRegular, size: 14))
                            .foregroundColor(.black)
                        
                        Text(message.timestamp)
                            .font(Font.custom(poppinsRegular, size: 12))
                            .foregroundColor(Color.hex("717171"))
                    }
                }
                Spacer()
            }
        }
        .padding(.horizontal, 16)
    }
}

struct Message: Identifiable, Equatable {
    let id: Int
    let text: String
    let isSender: Bool
    let timestamp: String
}
