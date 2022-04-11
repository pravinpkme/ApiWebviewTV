//
//  Structure.swift
//  apipractice
//
//  Created by Pravin Kumar on 03/04/22.
//

import Foundation
struct Post: Codable {
    var articles: [Article]
}

struct Article: Codable{
    let id: Int
    let title: String
    let body_html: String
    let summary_html : String 
    let handle: String
    let image: Image
}
struct Image : Codable{
        let alt: String
        let width, height: Int
        let src: String
    

}
