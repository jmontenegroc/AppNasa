//
//  PhotoViewModel.swift
//  AppNasa
//
//  Created by Alumno on 16/08/23.
//

import Foundation

import SwiftUI

class PhotoViewModel : ObservableObject{
    @Published  var arrPhotos = [PhotoModel]()
     
    func getPhotosData(){
        guard let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY&count=10")
        else{
            print("invalid url")
            return
        }
        let urlRequest = URLRequest(url: url)
        
    }
}
