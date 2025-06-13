//
//  Targets.swift
//  MapKitApplication
//
//  Created by Domenico Lugubre on 11/04/24.
//

import Foundation
import SwiftUI
import CoreLocation



struct Target: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
    let nome: String
    var imagePath : String? = nil
    var category : String? = nil
    
    
    // Al momento ho messo un fun fact di default per fare comparire la post card, teoricamente ogni target che ne ha uno deve essere
    // inzializzato con un fun fact e gli altri che hanno fun fact nil non mostrano la postcard.
    var description : String? = nil
    
    var visitato : Bool = false
    
    
}

var places: [String: [Target]] = [
    "Culture": [
        Target(coordinate: CLLocationCoordinate2D(latitude: 40.839759, longitude: 14.248553), nome: "Palazzo Zevallos Stigliano", imagePath:"palazzo zevallos", category: "Culture", description: "Do you know who Zevallos is? His father came from Vejorís, a village in the present-day area of Santiurde de Toranzo, but moved to Naples, where he married Angela Nicastro. Juan himself became an important merchant and banker, gaining prestige and wealth in the administration of the Neapolitan Viceroyalty."),
        Target(coordinate: CLLocationCoordinate2D(latitude: 40.832861, longitude: 14.243302), nome: "Galleria Borbonica", imagePath:"galleria borbonica", category: "Culture", description:"It was commissioned in 1853 by Ferdinando II of Borbone for military purposes. it was used as a bomb shelter during the Second World War. Only recently has it been rediscovered and brought to light, and is now an important tourist attraction."),
        Target(coordinate: CLLocationCoordinate2D(latitude: 40.836474, longitude: 14.240685), nome: "Palazzo Mannajoulo", imagePath:"palazzo mannajoulo", category: "Culture", description:"Did you know that this building was a film set? Director Ferzan Özpetek actually shot some scenes of his film 'Napoli Velata'. "),
        Target(coordinate: CLLocationCoordinate2D(latitude: 40.833351 , longitude:14.245915), nome: "Palazzo Serra di Cassano", imagePath:"palazzo serra di cassano", category: "Culture", description:"According to the legend, there is a ghost in the palace. The ghost could be that of a woman from the Serra di Cassano family, whose presence has been felt by some visitors or residents over the years."),
        Target(coordinate: CLLocationCoordinate2D(latitude: 40.83848, longitude:14.25271), nome: "CastelNuovo", imagePath:"castel novo", category: "Culture", description:"During the reign of Robert of Anjou, the castle was not only an imposing fortress but also a lively cultural centre where some of the greatest artists, doctors and writers of the time like Giotto, Petrarch and Boccaccio."),
        Target(coordinate: CLLocationCoordinate2D(latitude: 40.855169, longitude:14.258338), nome: "Museo d'Arte Contemporanea Donna Regina (MADRE)", imagePath:"museo donna regina", category: "Culture", description:"This museum is an essential stop: founded in 2005, it offers a permanent collection and space for temporary exhibitions, cultural events and educational initiatives."),
        Target(coordinate: CLLocationCoordinate2D(latitude: 40.843684, longitude: 14.239097), nome: "Castel Sant'Elmo", imagePath:"castel sant'elmo", category: "Culture", description:"In the past Castel Sant’Elmo was used as an observation point to spot enemy ships. Today, it offers a panoramic view of the city and the Gulf and is home to the Museo Novecento. "),
        Target(coordinate: CLLocationCoordinate2D(latitude: 40.859711, longitude:14.249253), nome: "Basilica di Santa Maria della Neve", imagePath:"basilica di santa maria della neve", category: "Culture", description:"According to the legend, in the year 352, on the night of 4 to 5 August, Our Lady appeared in a dream to a wealthy couple who were building a church.  She asked them to build a church where snow had fallen during the night.  The couple went to tell Pope Liberius and it turned out that he had had the same dream that night!"),
        Target(coordinate: CLLocationCoordinate2D(latitude: 40.84888, longitude: 14.25030), nome: "Piazza Dante", imagePath:"piazza dante", category: "Culture", description:"The square we now call 'Piazza Dante' was once called 'Largo del Mercatello'. Today, the statue of the great poet gives the square its name. Surrounded by churches and former monasteries, it is the meeting point of everyday life and history."),
        Target(coordinate: CLLocationCoordinate2D(latitude: 40.853630 , longitude:14.255021), nome: "Museo delle Arti Sanitarie", imagePath:"museo delle arti sanitarie", category: "Culture", description:"With over 12,000 exhibits, the museum is a place of healing and an exhibition space, it offers patients the opportunity for personal enrichment and healing through art and knowledge."),
        Target(coordinate: CLLocationCoordinate2D(latitude: 40.849985, longitude: 14.257903), nome: "Via San Gregorio Armeno", imagePath:"via san gregorio armeno", category: "Culture", description: "The alley of San Gregorio Armeno is famous for its nativity scene shops, where you can find figurines and accessories for decorating your nativity scene all year round.")
    ],
    "Street Art": [
        Target(coordinate: CLLocationCoordinate2D(latitude: 40.859147, longitude:14.249141), nome: "Murale LUCE", imagePath:"murales luce", category: "Street Art", description:"It’s created by Spanish street artist Tono Cruz. It depicts the smiling faces of the children of the Rione Sanità and conveys a strong sense of positivity and vitality."),
        Target(coordinate: CLLocationCoordinate2D(latitude:40.858333, longitude:14.252252), nome: "Via Santa Maria Antesaecula", imagePath:"via santa maria antesecula", category: "Street Art", description:"For its the reopening of this church, artists have added a mural of Totò and Peppino De Filippo from 'La banda degli onesti', offering a touch of pop culture and food for thought on society."),
        Target(coordinate: CLLocationCoordinate2D(latitude:40.859272, longitude:14.248304), nome: "Murale TIENM CA T TENG", imagePath:"murales tienm ca t teng", category: "Street Art", description: "What does 'Tienm ca teng' mean? It is the Neapolitan meaning for 'hold on', the muralist in Bansky, whose iconicity comes from the mystery of his identity and his unforgettable style."),
        Target(coordinate: CLLocationCoordinate2D(latitude:40.84131, longitude:14.24717), nome: "Murale Nu'mmescà'e fantasme cu ll'angiule", imagePath:"murales nu'mmescà'e fantasme cu ll'angiule", category: "Street Art", description:"It is a work that speaks of integration in the heart of the Rione Sanità: a Madonna with Afro features, with two children: one looks like an angel, while the other is fighting a demon that is grabbing his head."),
        Target(coordinate: CLLocationCoordinate2D(latitude: 40.837641, longitude: 14.246386), nome: "Ex Mercatino di Sant'Anna di Palazzo ", imagePath:"ex mercatino di sant'anna", category: "Street Art", description: "Have you ever wondered where Neapolitan artists such as Totò, Eduardo and Peppino De Filippo used to meet? In this ancient marketplace, now a cultural centre that hosts exhibitions, shows and concerts."),
        Target(coordinate: CLLocationCoordinate2D(latitude: 40.841379, longitude: 14.245282), nome: "Murale MARADONA", imagePath:"murales maradona", category: "Street Art", description:"A tribute to the Pibe de Oro: Created by several Neapolitan artists, the mural depicts Diego Armando Maradona, the Argentine footballer who played for Napoli from 1984 to 1991."),
        Target(coordinate: CLLocationCoordinate2D(latitude: 40.841378, longitude: 14.245283), nome: " Murale della Dea Iside velata", imagePath:"murales iside velata", category: "Street Art", description:"A piece of street art against violence against women: The mural, created by Neapolitan artist Rosaria Iazzetta, depicts the veiled goddess Isis with a swollen eye to raise awareness of violence against women."),
        Target(coordinate: CLLocationCoordinate2D(latitude: 40.841361, longitude:14.247142), nome: "Murale 'O pallone miez 'e machine", imagePath:"murales o pallone", category: "Street Art", description:"It’s dedicated to Luciano De Crescenzo, created by Michele Quercia and Francesca Avolio. It depicts De Crescenzo laughing as some boys use a broom to retrieve a ball from between cars."),
        Target(coordinate: CLLocationCoordinate2D(latitude: 40.841842, longitude:14.246217), nome: "Murale TOTO ", imagePath:"murales toto e peppino", category: "Street Art", description:"Created by Tono Cruz. It is  building not far from Totò's birthplace in Via Santa Maria Antesaecula. The work depicts the famous coffee scene between Totò and Peppino De Filippo in the film 'La banda degli onesti'."),
        Target(coordinate: CLLocationCoordinate2D(latitude: 40.841775, longitude:14.247718), nome: "Largo Baracche, Vico Figurelle", imagePath:"largo baracche", category: "Street Art", description:"The work is a tribute to two icons of Italian cinema, Bud Spencer and Sophia Loren. Their faces frame an enchanting view of Naples, celebrating the essence and timeless charm of the city.")
    ],
    "Sports": [
        Target(coordinate: CLLocationCoordinate2D(latitude: 40.842460, longitude: 14.237274), nome: "Petraio", imagePath:"petraio", category: "Sports", description:"Petraio steps is like a secret whispered between the streets of the city. When you climb those steps, it's like stepping into an ancient story. And when you reach the top, the view over the city and the Bay of Naples is simply breathtaking."),
            Target(coordinate: CLLocationCoordinate2D(latitude: 40.827965, longitude: 14.192947), nome: "Stadio Maradona", imagePath:"stadio maradona", category: "Sports", description:" Originally known as the Stadio del Sole (Stadium of the Sun). During the construction it was called the Centomila Stadium, probably because of its extraordinary capacity: on the day of its inauguration, 6 December 1959, for the match against Juventus (which Napoli won), more than 90,000 spectators were on their feet."),
            Target(coordinate: CLLocationCoordinate2D(latitude: 40.841379, longitude: 14.245282), nome: "Murale MARADON", imagePath:"murales maradona", category: "Sports", description:"A tribute to the Pibe de Oro: Created by several Neapolitan artists, the mural depicts Diego Armando Maradona, the Argentine footballer who played for Napoli from 1984 to 1991.")
    ],
 
    "Nature": [
        Target(coordinate: CLLocationCoordinate2D(latitude: 40.798660, longitude: 14.179632), nome: "Parco Virgiliano", imagePath:"parco virgiliano", category: "Nature", description:"Do you know who thought this was the best place to walk? It seems that Virgil, the ancient Roman poet, was inspired to write the 'Eneid' when he saw these landscapes. From here you can see the island of Nisida and the Bay of Bagnoli ."),
        Target(coordinate: CLLocationCoordinate2D(latitude: 40.831462, longitude: 14.24125), nome: "Lungomare", imagePath:"lungomare", category: "Nature", description: "Did you know that the word 'Mergellina' comes from the Greek-Byzantine? It meant 'coral', because this part of the coast was covered with abundant coral colonies."),
        Target(coordinate: CLLocationCoordinate2D(latitude: 40.832414, longitude: 14.240009), nome: "Villa Comunale", imagePath:"villa comunale", category: "Nature",description :"Inside Villa Comunale you will find the 'Cassa Armonica', built in the XIX century, where the Orchestra of the City of Naples used to play. In front of it there was the 'Caffè Vacca', an important literary café, destroyed by the shells of the Second World War"),
        Target(coordinate: CLLocationCoordinate2D(latitude: 40.843420, longitude: 14.24126), nome: "Certosa e Museo di San Martino", imagePath:"certosa e museo di san martino", category: "Nature", description: "The 'Certosa di San Martino' is an architectural jewel from the XIV century, where every corner hides a story." ),
        Target(coordinate: CLLocationCoordinate2D(latitude: 40.842507, longitude: 14.240068), nome: "Giardini Pensili", imagePath:"giardini pensili", category: "Nature", description:" In Giardini Pensili you can admire rare species of plants and flowers, as well as fountains and statues."),
        Target(coordinate: CLLocationCoordinate2D(latitude: 40.838220, longitude:14.234654), nome: "Parco Margherita ", imagePath:"parco margherita", category: "Nature", description:"Parco Margherita is a green oasis in the heart of the chaotic city. Walking among the trees and flowerbeds is like entering another world. And when you reach the lookout points, the view of the city and the Bay of Naples will take your breath away. "),
        Target(coordinate: CLLocationCoordinate2D(latitude: 40.823380 , longitude:14.215985), nome: "Villa Doria D'Angri ", imagePath:"villa doria", category: "Nature", description:"The Villa is part of the heritage of the University of Naples Parthenope and is used for higher education, national and international scientific conferences and cultural meetings. It also houses a Naval Museum."),
        Target(coordinate: CLLocationCoordinate2D(latitude: 40.831794, longitude:14.247424), nome: "Belvedere di Pizzofalcone", imagePath:"belvedere di pizzofalcone", category: "Nature", description:"The Monte Echia lift connects the charming hamlet with the splendid view of the Belvedere di Pizzofalcone, offering a convenient and panoramic way to explore the Santa Lucia area on the Naples waterfront. The official inauguration took place on Monday 8th April 2024."),
        Target(coordinate: CLLocationCoordinate2D(latitude: 40.828133 , longitude: 14.218213), nome: "Belvedere di Sant'Antonio a Posillipo", imagePath:"belvedere sant'antonio", category: "Nature", description: "The curves of the Sant'Antonio ramps reveal a mysterious and fascinating side of Naples. Each corner offers a new perspective, a unique glimpse of the hidden beauty of the city.")
    ],
    "Theatre": [
        Target(coordinate: CLLocationCoordinate2D(latitude: 40.839717, longitude: 14.254290), nome: "Teatro Mercadante", imagePath:"teatro mercadante", category: "Theatre", description:"The Mercadante Theatre began life as the Teatro del Fondo, named after a military company that built the building in 1777-78, entrusting its design to Colonel Securo. In 1870 the theatre was renamed in honour of Francesco Saverio Mercadante, an Apulian musician who had studied in Naples."),
        Target(coordinate: CLLocationCoordinate2D(latitude: 40.838999, longitude:14.248058), nome: "Teatro Augusteo", imagePath:"teatro agusteo", category: "Theatre", description:"It was one of the first reinforced concrete buildings designed by the engineer Pier Luigi Nervi, and Tito Schipa"),
        Target(coordinate: CLLocationCoordinate2D(latitude: 40.851083, longitude:14.251037), nome: "Teatro Bellini", imagePath:"teatro bellini", category: "Theatre", description:"A few years after its inauguration, the Bellini Theatre was completely destroyed by a fire and  rebuilt in 1871. It is even said that there was a non-natural presence among the boxes of the theatre, in particular a ghost, that of a nun."),
        Target(coordinate: CLLocationCoordinate2D(latitude: 40.837364, longitude:14.249853), nome: "Teatro San Carlo", imagePath:"teatro san carlo", category: "Theatre", description: "In the San Carlo Theatre in Naples, there was a mirror in every box facing the king's box. This was not only a decorative element, but also had an important social function: it allowed the king to discreetly observe the audience during the performances. According to the tradition of the time, no one could clap or express any form of approval until the king gave his signal.")
    ],
    "Religion": [
        Target(coordinate: CLLocationCoordinate2D(latitude: 40.849276, longitude: 14.254959), nome: "Cappella San Severo", imagePath:"cappella di san severo", category: "Religion", description:"It is said that Prince Raimondo di Sangro, a bizarre alchemist, created an incredibly light marble veil by a mysterious process called 'marbling'."),
        Target(coordinate: CLLocationCoordinate2D(latitude: 40.860282, longitude:14.253812), nome: "Chiesa di Santa Maria Maddalena", imagePath:"chiesa di santa maria maddalena", category: "Religion", description:"Inside  is possible to enter the catacombs of San Gaudioso, which preserve ancient frescoes and mosaics, including one depicting the Apostle Peter introducing a deceased person to Christ or possibly St Paul."),
        Target(coordinate: CLLocationCoordinate2D(latitude: 40.850664, longitude: 14.255662), nome: "Chiesa del Purgatorio ad Arco", imagePath:"chiesa del purgatorio ad arco", category: "Religion", description: "A story linked to the Church of Purgatory in Arco in Naples is that of the skull of Lucia. She was the daughter of a Neapolitan prince who died shortly after her marriage and is still venerated as the patron saint of young brides, symbolising eternal love and interrupted youth."),
        Target(coordinate: CLLocationCoordinate2D(latitude: 40.845470, longitude: 14.248902), nome: "Chiesa di San Nicola alla Carità ", imagePath:"chiesa di san nicola", category: "Religion", description:"In 1647, thanks to the generosity of a nobleman. Inside, the church houses works by great masters such as Francesco Solimena and Paolo De Matteis, making it an important example of Neapolitan Baroque art."),
        Target(coordinate: CLLocationCoordinate2D(latitude: 40.854633, longitude: 14.331881), nome: "Basilica di santa maria della Neve ", imagePath:"basilica di santa maria della neve", category: "Religion", description:"According to the legend, in the year 352, on the night of 4 to 5 August, Our Lady appeared in a dream to a wealthy couple who were building a church.  She asked them to build a church where snow had fallen during the night.  The couple went to tell Pope Liberius and it turned out that he had had the same dream that night!"),
        Target(coordinate: CLLocationCoordinate2D(latitude: 40.845180, longitude: 14.250376), nome: "Complesso Monumentale Sant'Anna ai Lombardi", imagePath:"complesso sant'anna ai lombardi", category: "Religion", description:"Today the management of Sant'Anna dei Lombardi is entrusted to the social cooperative ParteNeapolis. ParteNeapolis is committed to making Sant'Anna dei Lombardi accessible to all. "),
        Target(coordinate: CLLocationCoordinate2D(latitude: 40.843848, longitude: 14.252731), nome: "Chiesa di Santa Maria Donnaregina Nuova", imagePath:"chiesa di santa maria donnaregina", category: "Religion", description: "Do you know who DonnaRegina is? Donna Regina was the eldest daughter of Baron Toraldo. After the loss of her mother, she was a figure of strength and support to her younger sisters, Albina and Romita.")
        ]
]

var food: [String: [Target]] = [
    "Restaurant": [
        Target(coordinate: CLLocationCoordinate2D(latitude: 40.833515, longitude: 14.240542), nome: "Signora Bettola", category: "Restaurant"),
        Target(coordinate: CLLocationCoordinate2D(latitude: 40.837620, longitude: 14.24414), nome: "Nennella", category: "Restaurant"),
        Target(coordinate: CLLocationCoordinate2D(latitude: 40.835145, longitude: 14.241191), nome: "Antica Latteria Chiaia", category: "Restaurant"),
        Target(coordinate: CLLocationCoordinate2D(latitude: 40.842518, longitude: 14.248468), nome: "Trattoria Quartieri Spagnoli", category: "Restaurant"),
        Target(coordinate: CLLocationCoordinate2D(latitude: 40.835007, longitude: 14.23959), nome: "La Magnolia", category: "Restaurant"),
    ],
    "Pizza": [
        Target(coordinate: CLLocationCoordinate2D(latitude: 40.857342, longitude: 14.252282), nome: "Concettina 3 santi", category: "Pizza"),
        Target(coordinate: CLLocationCoordinate2D(latitude: 40.831732, longitude: 14.241774), nome: "Sorbillo", category: "Pizza"),
        Target(coordinate: CLLocationCoordinate2D(latitude: 40.844017, longitude: 14.231109), nome: "Enrico Porzio", category: "Pizza"),
        Target(coordinate: CLLocationCoordinate2D(latitude: 40.849737, longitude: 14.263312), nome: "Pizzeria Da Michele", category: "Pizza"),
        Target(coordinate: CLLocationCoordinate2D(latitude: 40.855870, longitude: 14.246382), nome: "Starita", category: "Pizza"),
        Target(coordinate: CLLocationCoordinate2D(latitude: 40.848493, longitude: 14.273519), nome: "Masardona", category: "Pizza")
    ],
    "Sushi": [
        Target(coordinate: CLLocationCoordinate2D(latitude:40.833716, longitude:14.23068), nome: "Roku", category: "Sushi"),
        Target(coordinate: CLLocationCoordinate2D(latitude:40.835760, longitude:14.240982), nome: "Carino Nikkei", category: "Sushi"),
        Target(coordinate: CLLocationCoordinate2D(latitude:40.843283, longitude:14.228048), nome: "Hachi Ristorante Giapponese", category: "Sushi")
    ],
    "Sweet": [
        Target(coordinate: CLLocationCoordinate2D(latitude:40.839085, longitude:14.249072), nome: "Poppella",  category: "Sweet"),
        Target(coordinate: CLLocationCoordinate2D(latitude:40.843830, longitude:14.248941), nome: "Casa Infante", category: "Sweet"),
        Target(coordinate: CLLocationCoordinate2D(latitude:40.840972 , longitude:14.248552), nome: "Chalet Ciro 1952", category: "Sweet"),
        Target(coordinate: CLLocationCoordinate2D(latitude:40.835007, longitude:14.239671), nome: "Mennella", category: "Sweet"),
        Target(coordinate: CLLocationCoordinate2D(latitude:40.84825, longitude:14.241774), nome: "Scaturchio", category: "Sweet")
    ]
]
