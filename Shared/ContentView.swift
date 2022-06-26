//
//  ContentView.swift
//  Shared
//
//  Created by Cody Coogan on 6/24/22.
//

import SwiftUI
import SystemConfiguration.CaptiveNetwork

struct ContentView: View {
    
    var body: some View {
        
        NavigationView{
            VStack{
                
                List{
                    PhraseInputCardView().listRowBackground(Color(uiColor: UIColor.red))
                    SpeedInputCardView().listRowBackground(Color(uiColor: UIColor.purple))
                    ColorPickerCardView().listRowBackground(Color(uiColor: UIColor.systemPink))
                    BrightnessCardView().listRowBackground(Color(uiColor: UIColor.blue))
                    ResetCardView().listRowBackground(Color(uiColor: UIColor.orange))
                    
                }.navigationTitle("Matrix Controller")
            }
        }.padding(0)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
