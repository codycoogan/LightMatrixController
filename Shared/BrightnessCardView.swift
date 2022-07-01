//
//  BrightnessCardView.swift
//  LightMatrixController (iOS)
//
//  Created by Cody Coogan on 6/26/22.
//

import SwiftUI

struct BrightnessCardView: View {
    @State var brightness: Double = 100
    var body: some View {
        
        VStack {
            HStack{
                Text("Brightness").font(.title).bold()
                Spacer()
            }
            Slider(value: $brightness, in: 0...255, step: 1) {_ in
                changeBrightness()
            }.padding(5)
            
            Text(String((Int(brightness)))).bold().font(.title3)
        }
            .padding()
    }
    
    func changeBrightness(){
        if(brightness != 0){
            print("Changing brightness to \(brightness)")
            let url = "http://192.168.4.1/brightness?brightness=\(Int(brightness))"
            let matrixBase = Base()
            matrixBase.sendRequest(destinationUrl: url)
        }
    }
}

struct BrightnessCardView_Previews: PreviewProvider {
    static var previews: some View {
        BrightnessCardView().previewLayout(.fixed(width: 400, height: 60)).background(Color.cyan)
    }
}


