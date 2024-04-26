//
//  ModelData.swift
//  ISRO
//
//  Created by Evgeniy K on 03.04.2024.
//

import Foundation

@MainActor
class ModelData: ObservableObject {

    let provider = NetworkProvider()

    @Published var spacecrafts = [Spacecraft]()
    @Published var launchers = [Launcher]()
    @Published var satellites = [Satellite]()
    @Published var centres = [Center]()

    // MARK: - functions to retrieve data from specific URL links

    func fetchSpacecrafts() async throws {
        var fetchedSpacecrafts: SpacecraftQuery
        fetchedSpacecrafts = try await provider.load(with: Link.spacecrafts.url)
        spacecrafts = fetchedSpacecrafts.spacecrafts
    }

    func fetchLauncher() async throws {
        var fetchedLaunchers: LauncherQuery
        fetchedLaunchers = try await provider.load(with: Link.launchers.url)
        launchers = fetchedLaunchers.launchers
    }

    func fetchSatellites() async throws {
        var fetchedSatellites: SatelliteQuery
        fetchedSatellites = try await provider.load(with: Link.satellites.url)
        satellites = fetchedSatellites.customer_satellites
    }

    func fetchCenters() async throws {
        var fetchedCenters: CenterQuery
        fetchedCenters = try await provider.load(with: Link.centres.url)
        centres = fetchedCenters.centres
    }
}
