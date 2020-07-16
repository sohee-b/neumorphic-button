//
//  ContentView.swift
//  neumorphic-button
//
//  Created by sohee on 2020/07/16.
//  Copyright © 2020 sohee. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack
            {
                Color.gray.edgesIgnoringSafeArea(.all)
                Button(action: buttonAction) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                        Image(systemName: "wand.and.stars")
                            .foregroundColor(Color.black.opacity(0.8))
                            .font(.system(size: 100))
                    }
                }.buttonStyle(NeumorphicButtonStyle())
        }
    }
    
    func buttonAction() {
        print("tapped!")
    }
}

struct NeumorphicButtonStyle: ButtonStyle {
    
    let width: CGFloat = 260
    let radius: CGFloat = 25
    
    func buttonUp(_ label: ButtonStyleConfiguration.Label) -> some View {
        return label
    }
    
    func makeBody(configuration: Self.Configuration) -> some View {
        let isPressed = configuration.isPressed
        return configuration.label
            .foregroundColor(Color.gray.opacity(0.8))
            .frame(width: width, height: width, alignment: .center)
            .shadow(color: Color.white.opacity(isPressed ? 0 : 0.3), radius: 8, x: -15, y: -15)
            .shadow(color: Color.black.opacity(isPressed ? 0 : 0.5), radius: 8, x: 15, y: 15)
            .overlay(
                RoundedRectangle(cornerRadius: radius)
                    .stroke(Color.gray.opacity(isPressed ? 0.1 : 0), lineWidth: 18)
                    .shadow(color: Color.black.opacity(isPressed ? 0.5 : 0), radius: 7, x: 15, y: 15)
                    .clipShape(
                        RoundedRectangle(cornerRadius: radius)
                )
        )
            .overlay(
                RoundedRectangle(cornerRadius: radius)
                    .stroke(Color.gray.opacity(isPressed ? 0.1 : 0), lineWidth: 15)
                    .shadow(color: Color.white.opacity(isPressed ? 0.45 : 0), radius: 9, x: -10, y: -10)
                    .clipShape(
                        RoundedRectangle(cornerRadius: radius)
                )
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
