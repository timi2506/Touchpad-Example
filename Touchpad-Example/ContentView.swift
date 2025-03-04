//
//  ContentView.swift
//  Touchpad-Example
//
//  Created by Tim on 04.03.25.
//

import SwiftUI
import Touchpad

struct ContentView: View {
    @State var buttonPresses: [String] = []

    var body: some View {
        ZStack {
        NavigationView {
                List {
                    NavigationLink("Example 1") {
                        TouchpadView(buttons: [
                            TouchpadButton(id: "button1", text: "Button1", symbolName: "apple.logo", boundaries: CGRect(x: 100, y: 100, width: 100, height: 100), action: {
                                print("button 1 pressed")
                            }, border: false, borderColor: nil, borderRadius: nil)
                        ], touchPadLabel: "Touchpad")
                    }
                    NavigationLink("Example 2") {
                        TouchpadView(buttons: [
                            TouchpadButton(id: "button1", text: "TextOnly", symbolName: nil, boundaries: CGRect(x: 100, y: 100, width: 100, height: 100), action: {
                                print("button 1 pressed")
                            }, border: false, borderColor: nil, borderRadius: nil),
                            TouchpadButton(id: "button2", text: "SymbolAndText", symbolName: "apple.logo", boundaries: CGRect(x: 300, y: 200, width: 100, height: 100), action: {
                                print("button 2 pressed")
                            }, border: false, borderColor: nil, borderRadius: nil),
                            TouchpadButton(id: "button3", text: nil, symbolName: "apple.logo", boundaries: CGRect(x: 50, y: 50, width: 100, height: 100), action: {
                                print("button 3 pressed")
                            }, border: false, borderColor: nil, borderRadius: nil)
                        ], touchPadLabel: nil)
                    }
                    NavigationLink("Example 3") {
                        TouchpadView(buttons: [
                            TouchpadButton(id: "button1", text: "TextOnly", symbolName: nil, boundaries: CGRect(x: 100, y: 100, width: 100, height: 100), action: {
                                print("button 1 pressed")
                            }, border: true, borderColor: nil, borderRadius: nil),
                            TouchpadButton(id: "button2", text: "SymbolAndText", symbolName: "apple.logo", boundaries: CGRect(x: 300, y: 200, width: 100, height: 100), action: {
                                print("button 2 pressed")
                            }, border: true, borderColor: .green, borderRadius: nil),
                            TouchpadButton(id: "button3", text: nil, symbolName: "apple.logo", boundaries: CGRect(x: 50, y: 50, width: 100, height: 100), action: {
                                print("button 3 pressed")
                            }, border: true, borderColor: .green, borderRadius: 15)
                        ], touchPadLabel: " TOUCHPAD")
                    }
                }.allowsHitTesting(true)
            }
            buttonPressesView(buttonPresses: $buttonPresses).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing).allowsHitTesting(true)
        }
    }
    func print(_ string: String) {
        buttonPresses.append(string)
    }
}

struct buttonPressesView: View {
    @Binding var buttonPresses: [String]

    var body: some View {
        List {
            Section("Log") {
                ForEach(buttonPresses, id: \.self) { buttonPress in
                    Text(buttonPress).font(.caption)
                }
            }
        }
        .listStyle(PlainListStyle())
        .opacity(0.5)
        .frame(width: 200, height: 100)
        .background(.gray.opacity(0.25))
        .cornerRadius(15)
    }
}
#Preview {
    ContentView()
}
