//
//  ItemModel.swift
//  ISRO
//
//  Created by Evgeniy K on 11.02.2024.
//

import Foundation

struct NavigationItem: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var description: String
}

struct ItemData {
    
    static let testItem = NavigationItem(title: "Test Item", description: "This is a text for example purposes")

    static let navigationItems = [
        NavigationItem(title: "Spacecrafts", description: "List of spacecraft and vehicles launched by ISRO"),
        NavigationItem(title: "Launchers", description: "Launch vehicles are used to carry spacecraft to space"),
        NavigationItem(title: "Satellites", description: "A brief information about launched satellites"),
        NavigationItem(title: "Centres", description: "ISRO Centres and Units")
    ]
}
