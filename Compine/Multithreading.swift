//
//  Multithreading.swift
//  Compine
//
//  Created by asmaa gamal  on 15/04/2024.
//

import Foundation
import Combine
class Multithreading{
    //////multithreading
    func multi(){
        let myStream = PassthroughSubject<Int,Never>()
        var subscription =  Set<AnyCancellable>()
        myStream.sink { value in
            print(value)
            print(Thread.current)
        }.store(in: &subscription)
        myStream.send(1)
        DispatchQueue.global().async{
            myStream.send(2)
        }
        
        
        
        myStream.subscribe(on: DispatchQueue.global()).sink(receiveValue: {value in /// The subscribe(on:) operator specifies that downstream operators (in this case, the sink operator) should receive and process values on a global dispatch queue.
            //    When you call myStream.send(3), the emission of the value 3 still occurs on the main thread because it's emitted by myStream.send(3) which is executed on the main thread.
            print(value)
            print(Thread.current)
        }).store(in: &subscription)
        
        myStream.send(3) // this will be on the main thread
        
        // we can also specify which thread we want this puplisher to be on like this example
        
        let mySubscription = URLSession.shared.dataTaskPublisher(for: URL(string: "https://jsonplaceholder.typicode.com")!).map({result in  // this will be on the global queue
            print(Thread.current.isMainThread)  // false
            
        }).sink(receiveCompletion: {_ in}) { value in
            print(Thread.current.isMainThread)   // false
        }
    }
}
