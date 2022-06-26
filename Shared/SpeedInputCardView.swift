//
//  SpeedInputCardView.swift
//  LightMatrixController (iOS)
//
//  Created by Cody Coogan on 6/25/22.
//

import SwiftUI

struct SpeedInputCardView: View {
    @State var speed: Double = 15
    var body: some View {
        
        VStack {
            HStack{
                Text("Updates Per Second").font(.title).bold()
                Spacer()
            }
            Slider(value: $speed, in: 0...100, step: 1) {_ in
                changeSpeed()
            }.padding(5)
            
            Text(String((Int(speed)))).bold().font(.title3)
        }
            .padding()
    }
    
    func changeSpeed(){
        if(speed != 0){
            print("Changing Speed to \(speed)")
            let url = "http://192.168.4.1/speed?speed=\(Int(speed))"
            let matrixBase = Base()
            matrixBase.sendRequest(destinationUrl: url)
        }
    }
}

struct SpeedInputCardView_Previews: PreviewProvider {
    static var previews: some View {
        SpeedInputCardView().previewLayout(.fixed(width: 400, height: 60)).background(Color.cyan)
    }
}

