//
//  SwiftUIView.swift
//  AroJamm
//
//  Created by Simone Boscaglia on 11/04/24.
//

import SwiftUI

struct IconButton : View {
    var label : String
    var systemImage : String?
    var imagePath : String?
    var iconSize : CGFloat?
    var buttonWidth : CGFloat?
    var action : (() -> Void)?
    var destination : (any View)? = nil

    @State var isPressed : Bool = false
    
    // Make inset shadow
    var body : some View {
        VStack {
            Button(action: action ?? {}) {
                HStack(spacing:20) {

                    if let systemImage {
                        Image(systemName: systemImage)
                            .frame(width: 30, height: 30)
                            .font(.system(size: (iconSize ?? 30)))
                            .foregroundColor(Color.accentColor)
                            .padding(.horizontal)
                    } else if let imagePath {
                        // https://ericasadun.com/2020/06/25/coloring-svg-assets-in-swiftui/
                        Image(imagePath)
                            .interpolation(.none)
                            .resizable()
                            .foregroundColor(Color.black)
                            .animation(.linear(duration:0.1), value:isPressed)
                            .frame(width:35, height:35)
                            .scaledToFit()
                            .padding(.horizontal)
                    } else {
                        Spacer()
                    }
                    Text(label)
                        .font(.title2)
                        .foregroundStyle(Color.black)
                        .animation(.linear(duration:0.1), value:isPressed)
                    Spacer()
                }
            }
            
            .padding()
            .frame(width: buttonWidth ?? 230)

        }
        .background(.white)
                .foregroundStyle(.black)
                .cornerRadius(120)
                .shadow(radius:5, y:2)
    }
}

#Preview {
    IconButton(label: "Test", systemImage: "gearshape.fill")
}
