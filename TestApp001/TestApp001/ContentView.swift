//
//  ContentView.swift
//  TestApp001
//
//  Created by Koki Kubota on 2020/06/03.
//  Copyright © 2020 Koki Kubota. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("SwiftUI")
            .font(.largeTitle)
            .fontWeight(.ultraLight)
            .foregroundColor(Color.blue)
            .lineLimit(nil)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .padding(0.0)
    }
}
