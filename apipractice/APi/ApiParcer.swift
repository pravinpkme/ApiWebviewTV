//
//  ApiParcer.swift
//  apipractice
//
//  Created by Pravin Kumar on 03/04/22.
//

import Foundation
struct Parser {
    func parse(comp : @escaping ([Article])->() ){
        let api = URL(string: "https://run.mocky.io/v3/cdc1c53e-2825-4162-826d-b8294e477934")
        URLSession.shared.dataTask(with: api!){
            data, response, error in
            if error != nil {
                print(error?.localizedDescription)
                return
            }
            do{
                let ParsingData = try   JSONDecoder().decode(Post.self, from: data!)
                comp(ParsingData.articles)
            }catch {
                
            }
        }.resume()
        
    }
    
    
}
