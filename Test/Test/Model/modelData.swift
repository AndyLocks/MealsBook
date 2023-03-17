//
//  modelData.swift
//  Test
//
//  Created by Galina Makarova on 17.03.23.
//

import Foundation


var request = URLRequest(url: URL(string: "https://www.themealdb.com/api/json/v1/1/search.php?s=")!)
let task = URLSession.shared.dataTask(with: request) { data, response, error in
    let JSON: String = String(decoding: data!, as: UTF8.self)
    let jsonData = JSON.data(using: .utf8)!
    var mailsPost = Meals(meals: nil)
    var mailsPost = try! JSONDecoder().decode(Meals.self, from: jsonData)
}
task.resume()

mealMarks = mailsPost

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
