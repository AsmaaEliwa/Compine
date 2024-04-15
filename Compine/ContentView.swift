//
//  ContentView.swift
//  Compine
//
//  Created by asmaa gamal  on 05/04/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var myTime :TestAssignTo = TestAssignTo()
    let myTimer = Timer()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("\(myTime.value)")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
