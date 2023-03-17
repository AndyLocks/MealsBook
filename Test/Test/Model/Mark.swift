//
//  Mark.swift
//  Test
//
//  Created by Galina Makarova on 17.03.23.
//

import Foundation
import SwiftUI
import CoreLocation

struct Mealsmark: Hashable, Codable, Identifiable{
    let id = UUID()
    let idMeal: String
    let strMeal: String
    //var strTags: String
    //var strDrinkAlternate: String?
    //var strYoutube: String?
    let strMealThumb: String
    let strCategory: String
    let strArea: String
    let strInstructions: String
    //var strIngredient: String?
    
    //var id: Int
    //var name: String
    //var area: String
    //var category: String
    //var image: String
    
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
            CLLocationCoordinate2D(
                latitude: coordinates.latitude,
                longitude: coordinates.longitude)
        }
    
    struct Coordinates: Hashable, Codable {
            var latitude: Double
            var longitude: Double
        }
}
