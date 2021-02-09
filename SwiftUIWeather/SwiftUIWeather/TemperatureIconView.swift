//
//  TemperatureIconView.swift
//  SwiftUIWeather
//
//  Created by Yago de Martin Lopez on 09/02/2021.
//

import SwiftUI

struct TemperatureIconView: View {
    @ObservedObject var imageLoader:ImageLoader
    @State var image:UIImage = UIImage()
    
    init(withURL url:String) {
           imageLoader = ImageLoader(urlString:url)
       }

       var body: some View {

               Image(uiImage: image)
                   .resizable()
                   .aspectRatio(contentMode: .fit)
                   .frame(width:100, height:100)
                   .onReceive(imageLoader.didChange) { data in
                   self.image = UIImage(data: data) ?? UIImage()
           }
       }

}

struct TemperatureIconView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureIconView(withURL: "http://openweathermap.org/img/wn/04d@2x.png")
    }
}
