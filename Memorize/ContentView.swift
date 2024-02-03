//
//  ContentView.swift
//  Memorize
//
//  Created by Jewoo Lee on 2/3/24.
//

import SwiftUI
<<<<<<< HEAD
// changes
struct ContentView: View {
    var body: some View {
        HStack{
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.orange)
=======

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
>>>>>>> 75a82ea3ec451eac01519770d1a1ca0edd988c87
        .padding()
    }
}

<<<<<<< HEAD
struct CardView: View{
    var isFaceUp: Bool = false
    var body: some View{
        ZStack{
            if isFaceUp {
                RoundedRectangle(cornerRadius: 25.0)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 25.0)
                    .strokeBorder(lineWidth: 1)
                Text("🐶").font(.largeTitle)
            }
            else{
                RoundedRectangle(cornerRadius: 25)
                    .foregroundColor(.orange)
            }
        }
    }
}




=======
>>>>>>> 75a82ea3ec451eac01519770d1a1ca0edd988c87
#Preview {
    ContentView()
}
