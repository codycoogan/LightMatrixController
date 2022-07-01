//
//  ContentView.swift
//  Shared
//
//  Created by Cody Coogan on 6/24/22.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    PhraseInputCardView().listRowBackground(Color(uiColor: UIColor.purple))
                    SpeedInputCardView().listRowBackground(Color(uiColor: UIColor.systemPink))
                    BrightnessCardView().listRowBackground(Color(uiColor: UIColor.systemPink))
                    ColorPickerCardView().listRowBackground(Color(uiColor: UIColor.purple))
                    ResetCardView().listRowBackground(Color(uiColor: UIColor.red))
                    
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
