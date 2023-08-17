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
    
     
    func getPhotosData() async throws{
        guard let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY&count=10")
        else{
            print("invalid url")
            return
        }
        let urlRequest = URLRequest(url: url)
        let (data,response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else   {
            print("error")
            return
        }

        let results = try JSONDecoder().decode([PhotoModel].self, from:data)
        
        print(results)
        DispatchQueue.main.async{
            self.arrPhotos = results
        }
        
    }
}
