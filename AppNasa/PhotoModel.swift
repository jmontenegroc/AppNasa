//
//  PhotoModel.swift
//  AppNasa
//
//  Created by Alumno on 16/08/23.
//

import Foundation

struct PhotoModel : Decodable, Identifiable{
    var id = UUID()
    var title : String
    var explanation : String
    var url :String
    
    enum CodingKeys : String, CodingKey{
        case title
        case explanation
        case url
    }
}
