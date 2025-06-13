//
//  AroJammApp.swift
//  AroJamm
//
//  Created by Simone Boscaglia on 10/04/24.
//

import SwiftUI

let categories = ["Culture", "Nature", "Street Art", "Theatre", "Religion", "Sports"]

let categoriesKey = "categories"
let foodsKey = "foods"
let tutorialCompletedKey = "tutorialCompleted"

let categoriesIcons : [String : String] =
[
    //"Art"        : "photo.artframe",
    "Culture"    : "person.crop.rectangle.fill",
    "Nature"     : "leaf.fill",
    "Street Art" : "paintbrush.fill",
    "Theatre"    : "theatermasks.fill",
    "Religion"   : "building.columns.fill",
    "Sports"     : "sportscourt.fill"
]

@main
struct AroJammApp: App {
    var categoriesSelected : Bool = false
    
    init() {
        //https://www.hackingwithswift.com/books/ios-swiftui/making-changes-permanent-with-userdefaults
        if let savedSet = UserDefaults.standard.data(forKey: categoriesKey) {
            if let decodedData = try? JSONDecoder().decode(Set<String>.self, from: savedSet) {
                if decodedData.isEmpty || decodedData == [] {
                    categoriesSelected = false
                }
                else{
                    categoriesSelected = true
                }
            }
        }
    }
    
    var body: some Scene {
        WindowGroup {
            if categoriesSelected {
                MapView()
            } else {
                WelcomeView()
            }
        }
        
    }
}
