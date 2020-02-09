//
//  Decoder.swift
//  Legist
//
//  Created by Alexander Gerega on 9/18/19.
//  Copyright © 2019 MetaProject. All rights reserved.
//

import Foundation

class JSONDecoderService {
    
    func decodeJSON<T: Codable>(of type: T.Type, json: JSON, completion: @escaping (T?)->()) {
        if let JSON = try? JSONSerialization.data(withJSONObject: json,
                                                  options: []) {
            let decoder = JSONDecoder()
            do {
                let model = try decoder.decode(T.self, from: JSON)
                completion(model)
            } catch let error {
                print(error)
                completion(nil)
            }
            
        } else {
            completion(nil)
        }
    }
    
    func decodeJSON<T: Codable>(of type: T.Type, json: [JSON], completion: @escaping (T?)->()) {
            if let JSON = try? JSONSerialization.data(withJSONObject: json,
                                                      options: []) {
                let decoder = JSONDecoder()
                if let model = try? decoder.decode(T.self,
                                                   from: JSON) {
                    completion(model)
                } else {
                    completion(nil)
                }
            } else {
                completion(nil)
            }
        }
    
}
