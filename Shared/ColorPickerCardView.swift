//
//  ColorPickerCardView.swift
//  LightMatrixController (iOS)
//
//  Created by Cody Coogan on 6/25/22.
//

import SwiftUI

struct ColorPickerCardView: View {
    @State private var letterColor =
    Color(.sRGB, red: 0, green: 0, blue: 0)
    
    @State private var backColor =
    Color(.sRGB, red: 0, green: 0, blue: 0)
    
    
    var body: some View {
        VStack {
            
            ColorPicker(selection:  $letterColor, label: {
                Text("Letter Color").font(.title).bold()
            })
            .onChange(of: letterColor, perform: changeLetterColor).padding(.bottom, 25)
            
                
            ColorPicker(selection: $backColor, label: {
                Text("Background Color").font(.title).bold()
                
            }).onChange(of: backColor, perform: changeBackgroundColor)
                
        }.padding()
    }
}

func changeLetterColor(newColor: Color)  {
    print("change letter color")
    let newColorUI = UIColor(newColor)
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    var alpha: CGFloat = 0
    
    newColorUI.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
    
    let matrixBase = Base()
    let url = "http://192.168.4.1/color?red=\(red)&green=\(green)&blue=\(blue)"
    matrixBase.sendRequest(destinationUrl: url)
}

func changeBackgroundColor(newColor: Color)  {
    print("change background color")
    let newColorUI = UIColor(newColor)
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    var alpha: CGFloat = 0
    
    newColorUI.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
    
    let matrixBase = Base()
    let url = "http://192.168.4.1/backgroundColor?red=\(red)&green=\(green)&blue=\(blue)"
    matrixBase.sendRequest(destinationUrl: url)
}

struct ColorPickerCardView_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerCardView()
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
