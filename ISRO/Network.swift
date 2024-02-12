//
//  Network.swift
//  ISRO
//
//  Created by Evgeniy K on 06.02.2024.
//

import Foundation
import SwiftUI

enum Link {
    case spacecrafts
    
    var url: URL {
        switch self {
        case .spacecrafts:
            return URL(string: "https://isro.vercel.app/api/spacecrafts")!
        }
    }
}

enum NetworkError: Error {
    case invalidURL
    case tooManyRequests
    case decodingError
}

//async await from AvenCode

private actor ServiceStore {
    
    func loadSpacecrafts() async throws -> [Spacecraft] {
        var spacecrafts = [Spacecraft]()
        
        let (data, response) = try await URLSession.shared.data(from: Link.spacecrafts.url)
        let httpResponse = response as? HTTPURLResponse
        let statusCode = httpResponse?.statusCode ?? 0
        
        if statusCode == 429 {
            throw NetworkError.tooManyRequests
        }
        guard let decodedQuery = try? JSONDecoder().decode(SpacecraftQuery.self , from: data) else {
            throw NetworkError.decodingError
        }
        spacecrafts = decodedQuery.spacecrafts
        return spacecrafts
    }
}


final class Network: ObservableObject {

    @Published var spacecrafts = [Spacecraft]()
    @Published var inProgress = false
    @Published var showError = false
    @Published var errorMessage = ""
    
    private let store = ServiceStore()
    
    @MainActor func fethcAllSpacecrafts() async {
        inProgress = true
        defer {
            inProgress = false
        }
        do {
            spacecrafts = try await store.loadSpacecrafts()
        } catch {
            print("Catch: \(error)")
            errorMessage = warningMessage(error: error as! NetworkError)
            showError = true
        }
    }
    
}
