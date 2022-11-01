//
//  ChucknorrisAPI.swift
//  App do chucknorris
//
//  Created by Wesley Camilo on 25/10/22.
//

import Foundation
import Alamofire

class ChucknorrisAPI {
    struct Resource {
        static var random: String {get {return "https://api.chucknorris.io/jokes/random"}}
        static var chuckImageURL: String {get {return "https://api.chucknorris.io/img/chucknorris_logo_coloured_small@2x.png"}}
    }
    
    
    func getChucknorrisPhrase(completion: @escaping (_ objeto: ChucknorrisModel?) -> Void ) {
        AF.request(Resource.random).response { response in
            guard let data = response.data else {
                completion(nil)
                return
            }
            
            if let objeto = try? JSONDecoder().decode(ChucknorrisModel.self, from: data) {
                completion(objeto)
            } else {
                completion(nil)
            }
        }
    }
    
    func getChuckImage(completion: @escaping (_ objeto: Data?) -> Void ) {
        AF.request(Resource.chuckImageURL).response { response in
            
            completion(response.data)
            
        }
    }
}

