//
//  NetwMen.swift
//  CollViewTest
//
//  Created by Никита Попов on 17.01.23.
//

import Foundation
// MARK: - RickAndMortyElement
struct RickAndMortyElement: Codable {
    let id: Int
    let name, status, species, type: String
    let gender: String
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

// MARK: - Location
struct Location: Codable {
    let name: String
    let url: String
}

typealias RickAndMorty = [RickAndMortyElement]


struct CreateInfo{
    var allPers:(([RickAndMortyElement])->Void)?
    private func parseJS(data: Data)->RickAndMorty?{
        let decoder = JSONDecoder()
        guard let res = try? decoder.decode([RickAndMortyElement].self, from: data) else { return nil }
        return res
    }
    func createData(idPers: [Int]){
        
        let idPersStr = idPers.map{String($0)}.joined(separator: ",")
        let startUrl = "https://rickandmortyapi.com/api/character/"+idPersStr
        guard let url = URL(string: startUrl) else { return }
        URLSession.shared.dataTask(with: url, completionHandler: {data, resp, err in
            guard let data  = data else { return }
            guard let result = parseJS(data: data) else { return }
            self.allPers?(result)
        }).resume()
    }
}
