//
//  Timer.swift
//  Compine
//
//  Created by asmaa gamal  on 05/04/2024.
//

import Combine
import Foundation

class MyTimer {
    var mySubscribe: AnyCancellable?

    init(){
        mySubscribe = Timer.publish(every: 1, on: .main, in: .common).autoconnect().sink { output in
            print("finished stream with \(output)")
        }
    }

    deinit {
        mySubscribe?.cancel()
//        mySubscribe = nil  diffrent way to cancel it 
    }
}


