//
//  Items.swift
//  ISRO
//
//  Created by Evgeniy K on 05.02.2024.
//

import Foundation

//MARK: Model Spacecraft
struct Spacecraft: Identifiable, Decodable, Hashable {
    let id: Int
    let name: String
}

struct SpacecraftQuery: Decodable {
    let spacecrafts: [Spacecraft]
}

extension Spacecraft {
    static let example = Spacecraft(id: 1001, name: "Soyuz")
}

//MARK: Model Launchers


//MARK: Model Customer Satellites
