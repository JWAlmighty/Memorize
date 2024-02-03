//
//  ContentView.swift
//  Memorize
//
//  Created by Jewoo Lee on 2/3/24.
//

import SwiftUI

// changes
struct ContentView: View {
//    let emojis: Array<String> = ["😘",  "🤣", "🙈", "👍", "👍"]
    let emojis = ["😘",  "🤣", "🙈", "👍", "👍"]

    var body: some View {
        HStack{
            ForEach(emojis.indices, id: \.self){ index in
                CardView(content: emojis[index])
            }
        }
        .foregroundColor(.orange)
        .padding()
    }
}
struct CardView: View{
    let content: String
    @State var isFaceUp: Bool = true
    var body: some View{
        ZStack(alignment: .center, content: {
            let base = RoundedRectangle(cornerRadius: 25.0)
            if isFaceUp {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 1)
                Text(content).font(.largeTitle)
            }
            else{
                RoundedRectangle(cornerRadius: 25)
                    .foregroundColor(.orange)
            }
        })
        .onTapGesture(perform: {
//            isFaceUp = !isFaceUp
            isFaceUp.toggle()
        })
    }
}


#Preview {
    ContentView()
}
