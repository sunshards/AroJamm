//
//  WelcomeView.swift
//  AroJamm
//
//  Created by Simone Boscaglia on 11/04/24.
//

import SwiftUI

struct WelcomeView: View {
    private let text = "Hi! 👋🏻 \nWelcome to Aro' Jamm. \nI will help you find in Naples what you love most! 😍"
    @State private var navLinkActive = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.accentColor.ignoresSafeArea()

                VStack {
                    Image("mascotte")
                        .resizable()
                        .scaledToFit()
                        .frame(width:300)
                    Text(text)
                        .font(.title2)
                        .foregroundStyle(.black)
                        .multilineTextAlignment(.center)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(15)
                        .padding()
                    Spacer()
                    IconButton(label:"Next") { navLinkActive = true }
                    Spacer()

                    
                }
                
            }
            .navigationDestination(isPresented: $navLinkActive) {
                QuestionCompanyView()
            }
            .navigationBarTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }

    }
        
}

#Preview {
    WelcomeView()
}
