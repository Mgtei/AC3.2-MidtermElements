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
    let weight: Int
    let meltingPoint: Int
    let boilingPoint: Int
    
    init(name: String, symbol: String, number: Int, weight: Int, meltingPoint: Int, boilingPoint: Int) {
        self.name = name
        self.symbol = symbol
        self.number = number
        self.weight = weight
        self.meltingPoint = meltingPoint
        self.boilingPoint = boilingPoint
    }
    convenience init?(withDictionary dict: [String : Any]) {
        if let name = dict["name"] as? String,
            let symbol = dict["symbol"] as? String,
            let number = dict["number"] as? Int,
            let weight = dict["weight"] as? Int,
            let meltingPoint = dict["melting_c"] as? Int,
            let boilingPoint = dict["boiling_c"] as? Int {
            
            self.init(name: name, number: number, weight: weight, meltingPoint: meltingPoint, boilingPoint: boilingPoint)
        }
        else {
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
