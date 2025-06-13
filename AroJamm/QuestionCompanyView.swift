//
//  WelcomeView.swift
//  AroJamm
//
//  Created by Simone Boscaglia on 11/04/24.
//

import SwiftUI



struct QuestionCompanyView: View {
    private let text = "Who are you traveling with? 🤔"
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
                    IconButton(label:"Just me", systemImage: "person.fill") { navLinkActive = true }
                        .padding()
                    IconButton(label:"Friends", systemImage: "person.2.fill", iconSize:23) { navLinkActive = true }
                    IconButton(label:"Family", systemImage: "figure.and.child.holdinghands") { navLinkActive = true }
                        .padding()
                }
            }
            .navigationDestination(isPresented: $navLinkActive) {
                QuestionCategoriesView()
            }
            
            .navigationBarTitle("")
            .navigationBarBackButtonHidden()
            .navigationBarHidden(true)
        }
        
    }
}

#Preview {
    QuestionCompanyView()
}
