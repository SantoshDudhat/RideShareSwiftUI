//
//  CallingView.swift
//  RideShare
//
//  Created by DREAMWORLD on 27/12/24.
//

import SwiftUI

struct CallingView: View {
    @Environment(\.presentationMode) var presentationMode

    @State private var callStart = false
    @State private var timer: Timer?
    @State private var elapsedTime: Int = 0 // Track elapsed time in seconds

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    stopTimer() // Stop the timer if the user goes back
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
            .padding(.horizontal, 16)

            VStack {
                Image("img_profile")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .stroke(themeGreenColor, lineWidth: 1)
                    }

                Text("Sergio Ramasis")
                    .font(Font.custom(poppinsMedium, size: 28))
                    .foregroundColor(.black)

                if callStart {
                    Text(formatElapsedTime(elapsedTime)) // Show timer label
                        .font(Font.custom(poppinsRegular, size: 34))
                        .foregroundColor(.black)
                } else {
                    Text("Calling....")
                        .font(Font.custom(poppinsMedium, size: 14))
                        .foregroundColor(textFieldGrayBoarder)
                }
            }
            .padding(.top, UIScreen.main.bounds.height / 5)

            Spacer()

            HStack(spacing: 16) {
                // Camera Icon
                Button(action: {}, label: {
                    CircleIconView(iconName: "ic_camera_switch", backgroundColor: themePrimaryLightGreenColor, isCallButton: false)
                })

                // Mute Icon
                Button(action: {}, label: {
                    CircleIconView(iconName: "ic_microphone", backgroundColor: themePrimaryLightGreenColor, isCallButton: false)
                })

                // Call Icon (End Call)
                Button(action: {
                    if callStart {
                        endCall()
                    }
                }, label: {
                    CircleIconView(iconName: "ic_call", backgroundColor: callStart ? .red : Color.hex("4CAF51"), isCallButton: true, rotationAngle: callStart ? 135 : 0)
                })

                // Video Icon
                Button(action: {}, label: {
                    CircleIconView(iconName: "ic_video_camera", backgroundColor: themePrimaryLightGreenColor, isCallButton: false)
                })

                // More Options Icon
                Button(action: {}, label: {
                    CircleIconView(iconName: "ic_more", backgroundColor: themePrimaryLightGreenColor, isCallButton: false)
                })
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 16)
        }
        .onAppear {
            startCallStartTimer()
        }
        .onDisappear {
            stopTimer()
        }
    }

    // Start a timer to toggle callStart after 5 seconds
    private func startCallStartTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if callStart {
                elapsedTime += 1 // Increment elapsed time after call starts
            } else {
                elapsedTime += 1
                if elapsedTime >= 5 {
                    callStart = true
                    elapsedTime = 0 // Reset elapsed time when the call starts
                }
            }
        }
    }

    // Stop the timer and reset state
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    // End the call
    private func endCall() {
        stopTimer()
        callStart = false
        elapsedTime = 0
    }

    // Format elapsed time as MM:SS
    private func formatElapsedTime(_ seconds: Int) -> String {
        let minutes = seconds / 60
        let seconds = seconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

#Preview {
    CallingView()
}

struct CircleIconView: View {
    var iconName: String
    var backgroundColor: Color
    var isCallButton = false
    var rotationAngle: Double = 0
    
    var body: some View {
        Circle()
            .fill(backgroundColor)
            .frame(width: isCallButton ? 65 : 50, height: isCallButton ? 65 : 50)
            .overlay(
                Image(iconName)
                    .resizable()
                    .rotationEffect(.degrees(rotationAngle))
                    .scaledToFit()
                    .frame(width: isCallButton ? 35 : 24, height: isCallButton ? 35 : 24)
            )
    }
}
