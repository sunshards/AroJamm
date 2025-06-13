//
//  WelcomeView.swift
//  AroJamm
//
//  Created by Simone Boscaglia on 11/04/24.
//

import SwiftUI

struct QuestionCategoriesView: View {
    @State private var selectedCategories : Set<String> = []
    @State private var tutorialCompleted = false
    @State private var showingTutorialAlert = false
    @State private var navLinkActive = false
    
    private let text = "Pick what you want to see! 😎"
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
        
    
    var body: some View {
        
        NavigationStack {
            ZStack {

                VStack {
                    Text(text)
                        .font(.title2)
                        .foregroundStyle(.black)
                        .multilineTextAlignment(.center)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(15)
                        .padding()
                    
                    // https://www.hackingwithswift.com/quick-start/swiftui/how-to-position-views-in-a-grid-using-lazyvgrid-and-lazyhgrid
                    
                    ScrollView {
                        LazyVGrid(columns: columns) {
                            ForEach(0..<categories.count, id: \.self) {i in
                                SelectableCard(label: categories[i], systemImage: categoriesIcons[categories[i]], userDefaultsKey: "categories", action: { isPressed in
                                    if isPressed {
                                        selectedCategories.insert(categories[i])
                                    } else {
                                        selectedCategories.remove(categories[i])
                                    }
                                })
                            }
                            .padding(5)
                        }
                    }.padding([.horizontal], 30)
                    
                    .scrollIndicators(.hidden)
                    .ignoresSafeArea()
                    
                    IconButton(label:"Next", action: {
                        let encoder = JSONEncoder()
                        
                        if let data = try? encoder.encode(selectedCategories) {
                            UserDefaults.standard.set(data, forKey: categoriesKey)
                        }
                        if tutorialCompleted {
                            showingTutorialAlert = true
                        } else {
                            navLinkActive = true
                        }
                    })
                    /*.simultaneousGesture(TapGesture().onEnded {
                        print("HI")
                        let encoder = JSONEncoder()
                        
                        if let data = try? encoder.encode(selectedCategories) {
                            UserDefaults.standard.set(data, forKey: categoriesKey)
                        }
                    })*/
                    
                    Spacer()
                    
                }
            }
            .background {
                Color.accentColor.ignoresSafeArea()
            }
            
            .navigationDestination(isPresented: $navLinkActive) {
                if tutorialCompleted {
                    MapView()
                } else {
                    TutorialMapView1()
                }
            }
        }
        .alert("Show tutorial", isPresented:$showingTutorialAlert) {
            Button("Cancel", role:.cancel) {
                tutorialCompleted = true
                UserDefaults.standard.set(true, forKey: tutorialCompletedKey)
                navLinkActive = true
            }
            Button("Show") {
                tutorialCompleted = false
                UserDefaults.standard.set(false, forKey: tutorialCompletedKey)
                navLinkActive = true
            }

        } message: {
            Text("Do you want to see the tutorial again?")
        }
        
        .onAppear(perform: {
            if let savedSet = UserDefaults.standard.data(forKey: categoriesKey) {
                if let decodedData = try? JSONDecoder().decode(Set<String>.self, from: savedSet) {
                    selectedCategories = decodedData
                }
            }
            print(selectedCategories)
            
            tutorialCompleted = UserDefaults.standard.bool(forKey: tutorialCompletedKey)
            print(tutorialCompleted)
        })
    }
    
        
}

#Preview {
    QuestionCategoriesView()
}
