//
//  Element.swift
//  AC3.2-MidtermElements
//
//  Created by Margaret Ikeda on 12/8/16.
//  Copyright © 2016 Margaret Ikeda. All rights reserved.
//

import Foundation
class Element {
    let name: String
    let symbol: String
    let number: Int
    let weight: Double
    let meltingPoint: Int
    let boilingPoint: Int
    let thumbnailImage: String
    let detailImage: String
    
    init(name: String, symbol: String, number: Int, weight: Double, meltingPoint: Int, boilingPoint: Int, thumbnailImage: String, detailImage: String) {
        self.name = name
        self.symbol = symbol
        self.number = number
        self.weight = weight
        self.meltingPoint = meltingPoint
        self.boilingPoint = boilingPoint
        self.thumbnailImage = thumbnailImage
        self.detailImage = detailImage
    }
    convenience init?(withDictionary dict: [String : Any]) {
        if let name = dict["name"] as? String,
            let symbol = dict["symbol"] as? String,
            let number = dict["number"] as? Int,
            let weight = dict["weight"] as? Double,
            let meltingPoint = dict["melting_c"] as? Int,
            let boilingPoint = dict["boiling_c"] as? Int {
            
            let detailImageString = getDetailImageString(symbol: symbol)
            let thumbnailImageString = getThumbnailImageString(symbol: symbol)
            
            self.init(name: name, symbol: symbol, number: number, weight: weight, meltingPoint: meltingPoint, boilingPoint: boilingPoint, thumbnailImage: thumbnailImageString, detailImage: detailImageString)
        }
        else    {
            return nil
        }
    }
    
    static func getElements(data: Data) -> [Element]? {
        var elementArray = [Element]()
        let jsonData = try? JSONSerialization.jsonObject(with: data, options: [])
        guard let jsonArray = jsonData as? [[String: Any]] else {
            print("no response")
            return nil
        }
        for everyElement in jsonArray {
            guard let dictWeNeed = everyElement as? [String : Any] else {
                return nil
            }
            if let newElement = Element(withDictionary: dictWeNeed) {
                elementArray.append(newElement)
            }
        }
        return elementArray
    }
}
private func getDetailImageString(symbol: String) -> String {
    var detailImageString = "https://s3.amazonaws.com/ac3.2-elements/"
    detailImageString += symbol
    detailImageString += ".png"
    return detailImageString
}
private func getThumbnailImageString(symbol: String) -> String {
    var thumbnailImageString = "https://s3.amazonaws.com/ac3.2-elements/"
    thumbnailImageString += symbol
    thumbnailImageString += "_200.png"
    return thumbnailImageString
}
