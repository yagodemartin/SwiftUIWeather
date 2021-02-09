//
//  ContentView.swift
//  SwiftUIWeather
//
//  Created by Yago de Martin Lopez on 09/02/2021.
//

import SwiftUI

struct ContentView: View {
    
   @ObservedObject var weatherVM: WeatherViewModel
   @State var image: UIImage = UIImage()
    
    init() {
        self.weatherVM = WeatherViewModel()
    }
    
    var body: some View {
        VStack(alignment: .center)  {
            TextField("Enter City Name", text: self.$weatherVM.cityName, onCommit:  {
                self.weatherVM.search()
            }).padding(30).font(.custom("Arial", size: 50)).fixedSize()
            
            HStack{
            Text(self.weatherVM.temperature).padding(30).font(.custom("Arial", size: 100)).fixedSize()
            
            
                TemperatureIconView(withURL: self.weatherVM.icon)
            }
       
            
        }.frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, minHeight: 0, idealHeight: 100, maxHeight: .infinity, alignment: .center).background(Color.green).edgesIgnoringSafeArea(.all)
    }
  
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
