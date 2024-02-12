//
//  Helpers.swift
//  ISRO
//
//  Created by Evgeniy K on 06.02.2024.
//

import Foundation

func warningMessage(error: NetworkError) -> String {
    switch error {
    case .invalidURL:
        return "Data can not be found at this URL"
    case .tooManyRequests:
        return "Error 429: Too many requests"
    case .decodingError:
        return "Unable to decode data"
    }
}
