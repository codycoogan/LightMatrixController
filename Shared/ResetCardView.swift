//
//  ResetCardView.swift
//  LightMatrixController (iOS)
//
//  Created by Cody Coogan on 6/26/22.
//

import SwiftUI

struct ResetCardView: View {
    var body: some View {
        Button(action: {
            reset()
        }, label: {
            Text("Reset")
                .fontWeight(.bold)
                .font(.title)
                .padding()
                .padding(5)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, alignment: .center)
        })
    }
    
    func reset(){
        let matrixBase = Base()
        
        let url = "http://192.168.4.1/reset"
        matrixBase.sendRequest(destinationUrl: url)
    }
}


struct ResetCardView_Previews: PreviewProvider {
    static var previews: some View {
        ResetCardView().previewLayout(.fixed(width: 400, height: 60)).background(Color.cyan)
    }
}
