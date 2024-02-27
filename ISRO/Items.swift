//
//  Items.swift
//  ISRO
//
//  Created by Evgeniy K on 05.02.2024.
//

import Foundation

//MARK: Model Spacecraft API
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


//MARK: Model Launchers API
struct Launcher: Identifiable, Decodable, Hashable {
    let id: String
}

struct LauncherQuery: Decodable {
    let launchers: [Launcher]
}

extension Launcher {
    static let launcherExample = Launcher(id: "Proton M")
}

//MARK: Model Customer Satellites
