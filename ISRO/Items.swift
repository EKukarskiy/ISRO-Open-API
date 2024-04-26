//
//  Items.swift
//  ISRO
//
//  Created by Evgeniy K on 05.02.2024.
//

import Foundation

//MARK: - Model Spacecraft
struct Spacecraft: Identifiable, Decodable, Hashable {
    let id: Int
    let name: String
}

struct SpacecraftQuery: Decodable {
    let spacecrafts: [Spacecraft]
}

// MARK: - Model Launchers
struct Launcher: Identifiable, Decodable, Hashable {
    let id: String
}

struct LauncherQuery: Decodable {
    let launchers: [Launcher]
}

// MARK: - Model Customer Satellites
struct Satellite: Identifiable, Decodable, Hashable {
    let id: String
    let country: String
    let launch_date: String
    let mass: String
    let launcher: String
}

struct SatelliteQuery: Decodable {
    let customer_satellites: [Satellite]
}

extension Satellite {
    static let satelliteExample = Satellite(id: "Agile", country: "Italy", launch_date: "23-04-2007", mass: "350", launcher: "PSLV-C8")
}

// MARK: - Model Centres
struct Center: Identifiable, Decodable, Hashable {
    let id: Int
    let name: String
    let Place: String
    let State: String
}

struct CenterQuery: Decodable {
    let centres: [Center]
}
