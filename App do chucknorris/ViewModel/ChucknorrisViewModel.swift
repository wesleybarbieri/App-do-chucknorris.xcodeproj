//
//  ChucknorrisViewModel.swift
//  App do chucknorris
//
//  Created by Wesley Camilo on 25/10/22.
//

import Foundation
import Alamofire
class ChucknorrisViewModel {
    let api: ChucknorrisAPI = ChucknorrisAPI()
    var model: ChucknorrisModel?
    
    func getChuckNorrisDetalhe(_ completion: @escaping () -> Void)  {
        self.api.getChucknorrisPhrase { objeto in
            self.model = objeto
            completion()
        }
    }
    func getChucknorrisImage(_ completion: @escaping (UIImage?) -> Void)  {
        self.api.getChuckImage { data in
            guard let data = data else{
                completion(nil)
                return
                
            }
            let image = UIImage(data: data)
            completion(image)
        }
    }
}
