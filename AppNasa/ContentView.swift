//
//  ContentView.swift
//  AppNasa
//
//  Created by Alumno on 16/08/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var PhotoVM = PhotoViewModel()
    
    var body: some View {
        ScrollView{
            VStack(spacing: 16){
                ForEach(PhotoVM.arrPhotos){ item in
                    VStack(spacing:32){
                        Text(item.title)
                            .font(.title.bold())
                            .frame(width:UIScreen.main.bounds.width-20 )
                        
                        AsyncImage(url:URL(string: item.url))
                            .frame(width:UIScreen.main.bounds.width-50)
                            .scaledToFit()
                            .clipped()
                    }
                    .background(Material.regular, in: RoundedRectangle(cornerRadius: 20, style: .continuous))
                }
                
            }
            .padding()
        }
        .navigationTitle("NASA")
        .onAppear(perform: APIget)
        
    }
    
    func APIget() {
        Task{
            do{
                try await PhotoVM.getPhotosData()
            }
            catch{
                print("error")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
