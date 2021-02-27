//
//  ContentView.swift
//  FancyList
//
//  Created by Larry Mcdowell on 2/21/21.
//

import SwiftUI

struct ContentView: View {
    @State var hmm:Int = 0
    @State var array = ["First Text", "Second Text", "Third Text"]
    @State var indices : [Int] = []
    var body: some View {
        GeometryReader { geo in
                    VStack {
                        Text("My List")
                            .font(.system(size: 40))
                            .bold()
                            .frame(width: geo.size.width * 0.95, alignment: .leading)
                            .padding(.top, 50)
                        ScrollView {
                            LazyVStack(spacing: 1) {
                                ForEach (0..<array.count, id: \.self) { index in
                                    if !indices.contains(index) {
                                        RowContent(text: array[index], index: index, indices : $indices)
                                            .frame(height: 60)
                                    }
                                }
                            }
                        }
                    }
                }
        Loader.init()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
