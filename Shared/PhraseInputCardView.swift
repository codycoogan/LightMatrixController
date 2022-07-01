//
//  PhraseInputCardView.swift
//  LightMatrixController (iOS)
//
//  Created by Cody Coogan on 6/25/22.
//

import SwiftUI


struct PhraseInputCardView: View {
    @State var inputPhrase: String = ""
    @FocusState private var isFocused: Bool
    var body: some View {
        VStack{
            HStack{
                Text("Input Phrase").font(.title).bold()
                Spacer()
            }
            TextField(
                "Text to display",
                text: $inputPhrase
            )
            .disableAutocorrection(true)
            .textFieldStyle(.roundedBorder)
            .autocapitalization(.none)
            .focused($isFocused)
            .colorScheme(.light)
            
            Button(action: {
                sendInput()
            }, label: {
                Text("Send")
                    .fontWeight(.bold)
                    .font(.headline)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(40)
                    .foregroundColor(.white)
                    .padding(5)
                
            })
        }.padding().cornerRadius(25)
    }
    
    func sendInput(){
        isFocused = false
        if(inputPhrase != ""){
            let matrixBase = Base()
            print("Sending \(inputPhrase)")
            let textToSend = inputPhrase.replacingOccurrences(of: " ", with: "%26").replacingOccurrences(of: "+", with: "%2B").replacingOccurrences(of: "<", with: "%3C").replacingOccurrences(of: ">", with: "%3E").replacingOccurrences(of: "%", with: "%25").uppercased()
            let url = "http://192.168.4.1/data?word=\(textToSend)"
            matrixBase.sendRequest(destinationUrl: url)
        }
    }
}

struct PhraseInputCardView_Previews: PreviewProvider {
    
    static var previews: some View {
        PhraseInputCardView().background(.red)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}


