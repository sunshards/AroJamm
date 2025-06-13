//
//  MapDoubleButton.swift
//  AroJamm
//
//  Created by Simone Boscaglia on 12/04/24.
//

// https://www.reddit.com/r/swift/comments/188gl0j/any_idea_how_to_recreate_apple_maps_button_style/

import SwiftUI

struct MapDoubleButton: View {
    var topButtonImageName: String
    var bottomButtonImageName: String
    var isObscured : Bool = false
    var buttonTapped: (ButtonType) -> ()

    enum ButtonType {
        case top
        case bottom
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 10.0) {
                button(buttonType: .top, imageName: topButtonImageName)
                Color.gray.frame(height: 1)
                button(buttonType: .bottom, imageName: bottomButtonImageName)
            }
            .frame(width: 35.0)
            .padding([.vertical], 5)
            .background {
                Color.white
                    .cornerRadius(5.0)
                    .shadow(color: .black.opacity(0.2), radius:5, x: 0.0, y: 0.0)
            }
            
            if isObscured {
                Color.black.opacity(0.6)
                    .frame(width:35.0, height:77.0)
                    .clipShape(RoundedRectangle(cornerRadius: 5.0))
            }
        }
    }

    func button(buttonType: ButtonType, imageName: String) -> some View {
        return Button(action: {
            buttonTapped(buttonType)
        }, label: {
            Image(systemName: imageName)
                .font(.system(size: 20.0))
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
        })
        .foregroundColor(.gray)
    }
}

#Preview {
    MapDoubleButton(
        topButtonImageName: "gearshape",
        bottomButtonImageName:  "gearshape.fill", 
        isObscured: true,
        buttonTapped:
        { tappedButton in
            switch tappedButton {
            case .top:
                print("Top Button Pressed")
            case .bottom:
                print("Bottom Button Pressed")
            }
        })
}
