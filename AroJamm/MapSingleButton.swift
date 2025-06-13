//
//  MapDoubleButton.swift
//  AroJamm
//
//  Created by Simone Boscaglia on 12/04/24.
//

import SwiftUI

struct MapSingleButton: View {
    var buttonImageName: String
    var isObscured : Bool = false
    var buttonTapped : (() -> Void)?
    var body : some View {
        ZStack {
            Button(action: buttonTapped ?? {}) {
                ZStack {
                    Image(systemName: buttonImageName)
                        .font(.system(size:20.0))
                        .foregroundStyle(.gray)
                        .frame(width: 35.0)
                        .padding([.vertical], 5)
                        .background {
                            Color.white
                                .cornerRadius(5.0)
                                .shadow(color: .black.opacity(0.2), radius:5, x: 0.0, y: 0.0)
                        }
                    if isObscured {
                        Color.black.opacity(0.6)
                            .frame(width:35.0, height:34.2)
                            .clipShape(RoundedRectangle(cornerRadius: 5.0))
                    }
                }
            }
            
        }
    }
}

#Preview {
    MapSingleButton(buttonImageName: "gear", isObscured: false, buttonTapped: {
        print("Button Test")
    })
}
