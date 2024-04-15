//
//  TestAssignTo.swift
//  Compine
//
//  Created by asmaa gamal  on 15/04/2024.
//
import Combine
import Foundation
class TestAssignTo:ObservableObject {
    @Published var value: Date  = Date() {
        didSet{
            print("the new value is \(value)")
        }
    }
    init(){
        Timer.publish(every: 1, on: .main , in: .common).autoconnect().assign(to: &$value)
    }
}
