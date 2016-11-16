//
//  Place.swift
//  Awesome Places
//
//  Created by Ludovic Ollagnier on 16/11/2016.
//  Copyright © 2016 Tec-Tec. All rights reserved.
//

import Foundation

struct Place: Hashable {

    enum Source {
        case internet
        case local
    }

    let name: String
    let latitude: Double?
    let longitude: Double?
    let address: String
    let phoneNumber: String

    let website: URL?
    let wikipedia: URL?

    var stars: Float
    var numberOfReviews: Int

    let origin: Source

    init(name: String, latitude: Double? = nil, longitude: Double? = nil, address: String, phoneNumber: String, website: URL? = nil, wikipedia: URL? = nil, stars: Float, numberOfReviews: Int, origin: Source = .local) {

        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.address = address
        self.phoneNumber = phoneNumber
        self.website = website
        self.wikipedia = wikipedia
        self.stars = stars
        self.numberOfReviews = numberOfReviews
        self.origin = origin
    }

    static func ==(lhs: Place, rhs: Place) -> Bool {
        if lhs.name == rhs.name && lhs.address == rhs.address {
            return true
        }
        return false
    }

    var hashValue: Int {
        return "\(name) \(address)".hashValue
    }
}
