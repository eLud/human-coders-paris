//
//  Directory.swift
//  Awesome Places
//
//  Created by Ludovic Ollagnier on 16/11/2016.
//  Copyright © 2016 Tec-Tec. All rights reserved.
//

import Foundation

class Directory {

    static let instance = Directory()

    private var places: Set<Place> = []

    private init() {
        if let locationDataUrl = Bundle.main.url(forResource: "location_api_example", withExtension: "json"), let jsonData = try? Data(contentsOf: locationDataUrl) {
            let json = JSON(data: jsonData)
            
            for (_,subJson):(String, JSON) in json["markers"] {

                guard let name = subJson["monumentName"].string,
                let address = subJson["address"].string,
                let phone = subJson["phoneNumber"].string,
                let website = subJson["website"].URL,
                let wikipediaLink = subJson["wikipediaLink"].URL,
                let reviews = subJson["reviews"].int,
                let stars = subJson["stars"].float,
                let latitude = subJson["coordinates"]["latitude"].double,
                let longitude = subJson["coordinates"]["longitude"].double else { continue }

                let place = Place(name: name, latitude: latitude, longitude: longitude, address: address, phoneNumber: phone, website: website, wikipedia: wikipediaLink, stars: stars, numberOfReviews: reviews, origin: .internet)
                add(place)
            }
        }
    }

    var allPlaces: [Place] {
        return Array(places)
    }

    func add(_ place: Place) {
        let result = places.insert(place)
        if result.inserted == false {
            print(place.name + " is already here!")
        } else {

            // On poste les notification Model_Updated
            let center = NotificationCenter.default
            center.post(name: Notification.Name("Model_Updated"), object: self)
        }
    }
}
