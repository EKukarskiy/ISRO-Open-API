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
    case launchers
    case satellites
    case centres

    var url: URL {
        switch self {
        case .spacecrafts:
            return URL(string: "https://isro.vercel.app/api/spacecrafts")!
        case .launchers:
            return URL(string: "https://isro.vercel.app/api/launchers")!
        case .satellites:
            return URL(string: "https://isro.vercel.app/api/customer_satellites")!
        case .centres:
            return URL(string: "https://isro.vercel.app/api/centres")!
        }
    }
}

enum NetworkError: Error {
    case invalidURL
    case tooManyRequests
    case decodingError
}

actor NetworkProvider {

    // MARK: - universal network function for working with API

    func load<T: Decodable>(with link: URL) async throws -> T {

        let (data, response) = try await URLSession.shared.data(from: link)
        let httpResponse = response as? HTTPURLResponse
        let statusCode = httpResponse?.statusCode ?? 0

        if statusCode == 429 {
            throw NetworkError.tooManyRequests
        }
        guard let decoded = try? JSONDecoder().decode(T.self, from: data) else {
            throw NetworkError.decodingError
        }
        return decoded
    }
}
