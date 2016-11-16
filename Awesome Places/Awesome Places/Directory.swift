//
//  Directory.swift
//  Awesome Places
//
//  Created by Ludovic Ollagnier on 16/11/2016.
//  Copyright © 2016 Tec-Tec. All rights reserved.
//

import Foundation

class Directory {

    private var places: Set<Place> = []

    var allPlaces: [Place] {
        return Array(places)
    }

    func add(_ place: Place) {
        let result = places.insert(place)
        if result.inserted == false {
            print(place.name + " is already here!")
        }
    }
}
