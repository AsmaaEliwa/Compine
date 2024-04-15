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



class MyClass{
    var anInt : Int = 0{
        didSet{
            print("the new value is \(anInt)")
        }
    }
}
var myObject = MyClass()
var myRange = (0...5).publisher.map{$0 * 2}.assign(to: \.anInt, on:myObject )
//    .sink{value in     // or u  can use sink
//        myObject.anInt = value
//
//    }


struct User{
var name:String
var id:Int
}
class SecClass {
    var user = CurrentValueSubject<User,Never>(User(name:"Asmaa",id:28))
    var userId: Int = 1 {
        didSet{
            print("user id is \(userId)")
        }
    }
    var subscription =  Set<AnyCancellable>()
    init(){
        user.map(\.id)
            .sink{[weak self ] value in   // in this case we cant use asign to on because it will create a memorey problem because it casuses a strong refrence
            self?.userId = value
        }
//            .assign(to: \.userId, on: self)
        .store(in: &subscription)
    }
    deinit{
        print("deinit")
    }
}
var mySecClass:SecClass?  = SecClass()
func handel(){
    mySecClass?.user.send(User(name:"saif",id:3))
    mySecClass = nil
}
