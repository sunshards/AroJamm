//
//  Postcard.swift
//  AroJamm
//
//  Created by Simone Boscaglia on 15/04/24.
//

import SwiftUI

struct Postcard: View {
    var title : String
    var image: String?
    var description : String?
    var wallpaperName : String
    
    var body: some View {
        ZStack {
            Image(wallpaperName)
                .ignoresSafeArea()
                .scaleEffect(0.5)
                .frame(width:100)
            
            VStack(spacing: -10) {
                if let image {
                    Image(image)
                        .resizable()
                        .frame(width: 200, height: 200)
                        .scaledToFill()
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .padding([.horizontal])
                        .background(.white)

                }
                VStack(spacing:-10) {
                    Text(title)
                        .font(.title2)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(Color.accentColor)
                        .fontWeight(.bold)
                        .padding()
                        .background(content: {
                            Color.white.blur(radius:5.0)
                        })
                    
                    VStack(spacing:15) {

                        if let description {
                            Text(description)
                                .font(.callout)
                                .foregroundStyle(.black)
                                .multilineTextAlignment(.center)
                            
                                .background(content: {
                                    Color.white.blur(radius:5.0)
                                })
                            
                            Image("mascotte")
                                .resizable()
                                .scaledToFit()
                                .frame(width:100)


                        }
                        else {
                            Spacer()
                            Image("mascotte")
                                .resizable()
                                .scaledToFit()
                                .frame(width:180)
                            Spacer()
                        }
                    }.padding(.horizontal)
                }.padding()
            }
            .background(.white.opacity(0.3))
            .clipShape(RoundedRectangle(cornerRadius: 50.0))
        }
    }
}

#Preview {
    Postcard(title: "Example Title", image:"example", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus at sagittis sapien. Praesent ac dui a est facilisis bibendum facilisis in nulla. Phasellus tincidunt lacinia eleifend. Nunc a tempor justo. Nulla facilisi. Sed vitae iaculis eros, eu efficitur leo. Pellentesque scelerisque fringilla leo vitae euismod. Nullam neque turpis, sollicitudin at fermentum ac, placerat id arcu.", wallpaperName: "Street Art")
}
