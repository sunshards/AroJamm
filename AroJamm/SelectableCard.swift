//
//  SwiftUIView.swift
//  AroJamm
//
//  Created by Simone Boscaglia on 11/04/24.
//

import SwiftUI

struct SelectableCard : View {
    var label : String
    var systemImage : String?
    var imagePath : String?
    var userDefaultsKey : String
    var updateToggle : Bool = true
    var action : ((Bool) -> Void)?

    @State var isPressed : Bool = false
    
    var labelColor : Color {
        if isPressed {
            return Color.white
        } else {
            return Color.black
        }
    }
    
    func buttonBackground() -> some View {
        if isPressed {
            // Why doesn't Color.White work ???
            return LinearGradient(gradient: Gradient(colors: [.gradientButton1, .gradientButton2]), startPoint: .top, endPoint: .bottom)
        } else {
            return LinearGradient(gradient: Gradient(colors: [.white, .white]), startPoint: .top, endPoint: .bottom)
                    }
    }
    
    /*init(label: String, systemImage: String? = nil, imagePath: String? = nil, action : ((Bool) -> Void)? = nil ) {
        self.label = label
        if let systemImage { self.systemImage = systemImage }
        if let imagePath { self.imagePath = imagePath }
        if let action { self.action = action }
    }*/
    
    // Make inset shadow
    var body : some View {
        
        ZStack {
            //buttonBackground()
            
            Button(action: {
                if updateToggle {
                    isPressed.toggle()
                    if let action { action(isPressed) }
                } else {
                    if let action { action(true) }
                }
            }) {
                VStack(spacing:10) {
                    Spacer()
                    if let systemImage {
                        Image(systemName: systemImage)
                            .font(.system(size: 30))
                            .foregroundColor(labelColor)
                    } else if let imagePath {
                        // https://ericasadun.com/2020/06/25/coloring-svg-assets-in-swiftui/
                        ZStack {
                            Image(imagePath)
                                .interpolation(.none)
                                .resizable()
                                .foregroundColor(labelColor)
                                .animation(.linear(duration:0.1), value:isPressed)
                                .frame(width:35, height:35)
                                .scaledToFit()
                        }
                        
                    }
                    Text(label)
                        .foregroundStyle(labelColor)
                        .animation(.linear(duration:0.1), value:isPressed)
                    Spacer()
                }
                .frame(width:150)
                .background(buttonBackground())
                
            }.onAppear() {
                if updateToggle {
                    var selectedCategories : Set<String> = []
                    //https://www.hackingwithswift.com/books/ios-swiftui/making-changes-permanent-with-userdefaults
                    if let savedSet = UserDefaults.standard.data(forKey: userDefaultsKey) {
                        if let decodedData = try? JSONDecoder().decode(Set<String>.self, from: savedSet) {
                            selectedCategories = decodedData
                        }
                    }
                    
                    if selectedCategories.contains(self.label) {
                        self.isPressed = true
                    }
                    
                }
            }
        }
        .frame(height:100)
        .foregroundStyle(.black)
        .cornerRadius(15)
        .shadow(radius:2, y:2)
        .animation(.linear(duration:0.1), value:isPressed)
    }
}

#Preview {
    SelectableCard(label: "Test", systemImage: "leaf.fill", userDefaultsKey: "", updateToggle: false, action: {a in print(a)})
}
