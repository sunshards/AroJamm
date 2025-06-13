//
//  ContentView.swift
//  MapKitApp
//
//  Created by Simone Boscaglia on 10/04/24.
//

import SwiftUI
import MapKit


struct TutorialMapView6: View {
    @StateObject private var userLocation = UserLocation()
    @State private var position : MapCameraPosition = .region(naplesRegion)
    @State private var routes: [MKRoute] = []
    @State private var dest: CLLocationCoordinate2D = CLLocationCoordinate2D()
    @State private var paths : [(String, Target)] = []
    @State private var chronology: [Target] = []
    
    @State private var showingEatingModal : Bool = false
    @State private var showingPostcard : Bool = false
    @State private var showingHistory : Bool = true
    @State private var showingResetAlert : Bool = false
    @State private var showingMapsAlert = false
    
    @State private var navLinkActive = false
    @State private var navTutorialProceed = false

    @State private var postcardSettingsDetent = PresentationDetent.fraction(0.5)
    @State private var eatingSettingsDetent = PresentationDetent.fraction(0.2)
    
    @State private var selectedFoods : Set<String> = []
    @State private var selectedCategories : Set<String> = []
    
    @State private var animationOpacity = 1.0
    @State private var animationAmount = 0.0
    
    @State private var nextLocation = Target(coordinate: naplesCoordinates, nome: "Centro di Napoli")
    
    var body: some View {
        NavigationStack {
            ZStack {
                Map(position: $position) {
                    // Aggiungi gli Annotation solo se il pulsante della cronologia è stato premuto
                    if showingHistory {
                        ForEach(chronology) { item in
                            Marker(item.nome, coordinate: item.coordinate).tint(Color.mapText)
                        }
                    }
                    
                    UserAnnotation()
                    ForEach(paths, id: \.1.id) { path in
                        Annotation("", coordinate: path.1.coordinate) {
                            VStack {
                                // Se la locazione ha un funfact viene mostrato il punto interrogativo con l'animazione
                                if nextLocation.description != nil {
                                    VStack {
                                        
                                        ZStack {
                                            
                                            RoundedRectangle(cornerRadius: 70.0)
                                                .fill(.white)
                                                .frame(width:70, height:70)
                                                .blur(radius:animationAmount)
                                                .scaleEffect(animationAmount*2)
                                                .opacity(3 - animationAmount*2)
                                                .animation(
                                                    .easeInOut(duration: 1.2)
                                                    .delay(0.5)
                                                    .repeatForever(autoreverses: false),
                                                    value: animationAmount
                                                ).onAppear {
                                                    animationAmount = 1.5
                                                }
                                                .opacity(animationOpacity)
                                                .animation(.default, value:animationOpacity)
                                            
                                            Button(action: {
                                                showingPostcard = true
                                                animationOpacity = 0.0
                                            }) {
                                                Image("example") // Inserisco l'emoji sulla mappa
                                                    .resizable()
                                                    .frame(width:70, height:70)
                                                    .clipShape(RoundedRectangle(cornerRadius: 70.0))
                                                    .font(.largeTitle) // Regola la dimensione del font
                                                    .background(content: {
                                                        Circle()
                                                            .fill(.white)
                                                            .frame(width:55, height:55)
                                                        
                                                    })
                                            }
                                            
                                        }
                                        
                                        ForEach(1..<20){ _ in
                                            Spacer()
                                        }
                                        
                                        
                                    }
                                    
                                    // Altrimenti viene mostrata l'icona del luogo
                                    
                                } else {
                                    Button(action: {}) {
                                        if let category = nextLocation.category {
                                            Image(systemName:(categoriesIcons[category] ?? "questionmark")) // Inserisco l'emoji sulla mappa
                                                .font(.largeTitle) // Regola la dimensione del font
                                            /*Image("example")
                                             .resizable()*/
                                        }
                                    }
                                }
                                
                            }
                        }.annotationTitles(.visible)
                        Marker(path.1.nome, coordinate: path.1.coordinate).tint(Color.accentColor).annotationTitles(.visible)

                    }
                    if !routes.isEmpty {
                        ForEach(routes, id: \.self) { route in
                            MapPolyline(route)
                                .stroke(.blue, lineWidth: 5)
                        }
                    }
                }
                
                Color.black.ignoresSafeArea().opacity(0.6)

                // Layer dei pulsanti
                VStack {
                    ZStack {
                    // Pulsanti in alto
                        HStack(alignment: .top) {
                            
                            // Pulsante reset
                            
                            MapSingleButton(buttonImageName: "arrow.clockwise", isObscured: true, buttonTapped: {})
                            Spacer()
                            
                            // Pulsanti cronologia e food
                            MapDoubleButton(
                                topButtonImageName: showingHistory ? "clock.fill" : "clock",
                                bottomButtonImageName: "fork.knife.circle") { _ in }
                            
                        }
                    }
                    
                    Spacer()
                    
                    // Pulsanti in basso
                    HStack(spacing:15) {
                        Button(action: {}, label: {
                            VStack {
                                
                                // Pulsante Aro' Jamm ( next location )
                                ZStack {
                                    
                                    Color.accentColor
                                    Button(action: {},
                                           label: {
                                        HStack(spacing:20) {
                                            Image("hand")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width:47, height:47)
                                                .foregroundColor(.white)
                                            Text("NEXT")
                                                .font(.title)
                                                .foregroundStyle(.white)
                                                .fontWeight(.bold)
                                        }
                                        .padding(.horizontal)
                                    })
                                    
                                    Color.black.ignoresSafeArea().opacity(0.6)

                                }.frame(width:200, height:90)
                                    .clipShape(RoundedRectangle(cornerRadius: 30))
                                    .shadow(radius:5,y:3)
                                
                            }
                        })
                        // Pulsante Go
                        Button(action: {}) {
                            VStack {
                                ZStack {
                                    Color.green
                                    Image(systemName:"figure.walk")
                                        .foregroundStyle(.white)
                                        .font(.largeTitle)
                                        .fontWeight(.bold)
                                    Color.black.ignoresSafeArea().opacity(0.6)

                                }
                            }.frame(width: 90, height:90)
                                .clipShape(RoundedRectangle(cornerRadius: 30))
                                .shadow(radius:5,y:3)
                        }
                        // Alert pulsante GO
                        .alert(isPresented: $showingMapsAlert) {
                            Alert(
                                title: Text("Go to Maps"),
                                message: Text("Come back to the app to see where to go next!"),
                                primaryButton: .default(Text("Ok")) {
                                    routes.removeAll() //rimuove la polilinea dopo aver premuto il bottone go
                                    paths.removeAll() //rimuove il pin della posizione dopo aver premuto il bottone go
                                    openMaps()
                                }, secondaryButton: .cancel(Text("Cancel"))
                            )
                        }
                        
                    }
                    .padding([.horizontal],20)
                    
                    /*NavigationLink(isActive: $navLinkActive, destination: { WelcomeView() }, label: {
                     EmptyView()
                     })*/
                    
                }
                .padding()
                

                // Mascotte and Text
                VStack {
                    Spacer()
                    Spacer()
                    VStack() {
                        
                        HStack {
                            Spacer()
                            Image("mascotte")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width:150)
                            Spacer()
                        }
                        Text("If you miss what you've seen, take a trip down memory lane with the history button! →")
                            .font(.title3)
                            .foregroundStyle(.black)
                            .multilineTextAlignment(.center)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(15)
                            .padding([.horizontal],10)
                        
                    }.padding([.horizontal],20)
                    Spacer()
                }
                
                // Navigation dell'alert Reset Preferences
                .navigationDestination(isPresented: $navLinkActive) {
                    QuestionCompanyView()
                }
                .navigationDestination(isPresented: $navTutorialProceed) {
                    TutorialMapView7()
                }
                
                //https://stackoverflow.com/questions/56700752/swiftui-half-modal
                
                // Modale del cibo
                .sheet(isPresented: $showingEatingModal, onDismiss: {
                    let encoder = JSONEncoder()
                    
                    if let data = try? encoder.encode(selectedFoods) {
                        UserDefaults.standard.set(data, forKey: foodsKey)
                    }
                }) {
                    // Cards per la selezione dei tipi di cibo
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            Spacer()
                            SelectableCard(label: "Pizza", imagePath: "pizza", userDefaultsKey: "foods", updateToggle: false, action: { _ in
                                selectedFoods = ["Pizza"]
                                nextFoodLocation()
                            })
                            SelectableCard(label: "Restaurant", systemImage: "wineglass", userDefaultsKey: "foods", updateToggle: false, action: { _ in
                                selectedFoods = ["Restaurant"]
                                nextFoodLocation()
                                
                            })
                            SelectableCard(label: "Sushi", imagePath: "sushi", userDefaultsKey: "foods", updateToggle: false, action: { _ in
                                selectedFoods = ["Sushi"]
                                nextFoodLocation()
                                
                            })
                            SelectableCard(label: "Sweets", imagePath: "sweet", userDefaultsKey: "foods", updateToggle: false, action: { _ in
                                selectedFoods = ["Sweet"]
                                nextFoodLocation()
                            })
                            Spacer()
                        }
                        .padding()
                    }
                    
                    .presentationDetents(
                        [.fraction(0.2)],
                        selection: $eatingSettingsDetent
                    )
                }
                
                //Modale della postcard
                .sheet(isPresented: $showingPostcard, content: {
                    
                    Postcard(title: nextLocation.nome, image:"example", description: nextLocation.description ?? "", wallpaperName: nextLocation.category ?? "Street Art")
                    
                        .presentationDetents(
                            [.fraction(0.95)],
                            selection: $postcardSettingsDetent
                        )
                })
                
                .alert("Reset preferences", isPresented:$showingResetAlert) {
                    Button("Reset", role:.destructive) {
                        // Reset the categories and foods sets
                        let emptySet : Set<String> = []
                        let encoder = JSONEncoder()
                        
                        if let data = try? encoder.encode(emptySet) {
                            UserDefaults.standard.set(data, forKey: categoriesKey)
                            UserDefaults.standard.set(data, forKey: foodsKey)
                        }
                        navLinkActive = true
                    }
                    Button("Cancel", role:.cancel) {}
                } message: {
                    Text("Are you sure you want to reset your preferences?")
                }
                
                .navigationBarTitle("")
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden()
                
            }
        }
        .onTapGesture {
            navTutorialProceed = true
        }
    }
    
    func openMaps() {
        let url = URL(string: "maps://?saddr=\(userLocation.currentLocation.latitude),\(userLocation.currentLocation.longitude)&daddr=\(dest.latitude),\(dest.longitude)&dirflg=w")
        if UIApplication.shared.canOpenURL(url!) {
            UIApplication.shared.open(url!, options: [:], completionHandler: nil)
        }
    }
    
    // Restituisce il Target che ha trovato (quello più vicino)
    func getDirections(currentLocation: CLLocationCoordinate2D, places: [String: [Target]],selectedCategories: Set<String>) -> Target {
        self.routes.removeAll()
        self.paths.removeAll()
        
        // Ordina il percorso in base alla distanza dalla posizione corrente
        for i in selectedCategories{
            let luoghi = places[i]!.filter{
                !$0.visitato
            }.sorted { dest1, dest2 in
                let location1 = CLLocation(latitude: dest1.coordinate.latitude, longitude: dest1.coordinate.longitude)
                let location2 = CLLocation(latitude: dest2.coordinate.latitude, longitude: dest2.coordinate.longitude)
                let distance1 = location1.distance(from: CLLocation(latitude: currentLocation.latitude, longitude: currentLocation.longitude))
                let distance2 = location2.distance(from: CLLocation(latitude: currentLocation.latitude, longitude: currentLocation.longitude))
                return distance1 < distance2
            }
            paths.append((i,luoghi[0]))
        }
        
        paths.sort { dest1, dest2 in
            let location1 = CLLocation(latitude: dest1.1.coordinate.latitude, longitude: dest1.1.coordinate.longitude)
            let location2 = CLLocation(latitude: dest2.1.coordinate.latitude, longitude: dest2.1.coordinate.longitude)
            let distance1 = location1.distance(from: CLLocation(latitude: currentLocation.latitude, longitude: currentLocation.longitude))
            let distance2 = location2.distance(from: CLLocation(latitude: currentLocation.latitude, longitude: currentLocation.longitude))
            return distance1 < distance2
        }
        paths = [paths[0]]
        dest = paths[0].1.coordinate
        
        // Calcola il centro della nuova regione
        let centerLatitude = (userLocation.currentLocation.latitude + dest.latitude) / 2
        let centerLongitude = (userLocation.currentLocation.longitude + dest.longitude) / 2
        let center = CLLocationCoordinate2D(latitude: centerLatitude, longitude: centerLongitude)
        
        // Calcola lo span della nuova regione
        let latitudeDelta = abs(userLocation.currentLocation.latitude - dest.latitude) * 1.5 // Moltiplica per un fattore per uno zoom più ampio
        let longitudeDelta = abs(userLocation.currentLocation.longitude - dest.longitude) * 1.5 // Moltiplica per un fattore per uno zoom più ampio
        let span = MKCoordinateSpan(latitudeDelta: latitudeDelta, longitudeDelta: longitudeDelta)
        
        // Imposta la nuova regione sulla mappa
        position = .region(MKCoordinateRegion(center: center, span: span))
        
        
        // Prendi il posto più vicina come punto di partenza per il percorso
        let request = MKDirections.Request()
        request.transportType = .walking
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: currentLocation)) //punto di partenza
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: dest)) //destinazione
        Task {
            let directions = MKDirections(request: request)
            let response = try? await directions.calculate()
            if let route = response?.routes.first {
                routes.append(route)
            }
        }
        return paths[0].1
    }
    
    // Funzione chiamata da ognuna delle card della modale del cibo
    func nextFoodLocation() {
        if let savedData = UserDefaults.standard.data(forKey: foodsKey) {
            if let decodedData = try? JSONDecoder().decode(Set<String>.self, from: savedData) {
                selectedCategories = decodedData
            }
        }
        
        // Nasconde la modale dopo aver premuto il tasto
        showingEatingModal = false
        
        // Prende la prossima posizione utilizzando come array quello del cibo
        nextLocation = getDirections(currentLocation: userLocation.currentLocation, places: food, selectedCategories: selectedFoods)
    }
    
    // Funzione per calcolare il centro e lo span della mappa basato sulla cronologia
    // Funzione per calcolare il centro e lo span della mappa basato sulla cronologia
    func updateMapRegionForHistory() {
        if !chronology.isEmpty {
            var allCoordinates: [CLLocationCoordinate2D] = chronology.map { $0.coordinate }
            allCoordinates.append(userLocation.currentLocation) // Include anche la posizione corrente
 
            // Calcola la bounding box che contiene tutti i punti (cronologia + posizione corrente)
            let (minLatitude, maxLatitude) = allCoordinates.reduce((90.0, -90.0)) { (min($0.0, $1.latitude), max($0.1, $1.latitude)) }
            let (minLongitude, maxLongitude) = allCoordinates.reduce((180.0, -180.0)) { (min($0.0, $1.longitude), max($0.1, $1.longitude)) }
 
            // Calcola il centro della nuova regione
            let centerLatitude = (minLatitude + maxLatitude) / 2
            let centerLongitude = (minLongitude + maxLongitude) / 2
            let center = CLLocationCoordinate2D(latitude: centerLatitude, longitude: centerLongitude)
 
            // Calcola lo span della nuova regione con un margine aggiuntivo per garantire che tutti i punti siano visibili
            let extraMargin = 0.01 // Modifica il margine extra come preferisci
            let latitudeDelta = (maxLatitude - minLatitude) + extraMargin
            let longitudeDelta = (maxLongitude - minLongitude) + extraMargin
            let span = MKCoordinateSpan(latitudeDelta: latitudeDelta, longitudeDelta: longitudeDelta)
 
            // Imposta la nuova regione sulla mappa
            position = .region(MKCoordinateRegion(center: center, span: span))
        }
    }
}

#Preview {
    TutorialMapView6()
}
