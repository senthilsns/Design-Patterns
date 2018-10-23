//
//  Adapter.swift
//  DesignPattern
//
//  Created by SENTHIL on 23/10/18.
//  Copyright © 2018 Personal. All rights reserved.
//

/*
 Adapter is a structural design pattern that allows objects with incompatible interfaces to work together. In other words, it transforms the interface of an object to adapt it to a different object.
*/

import UIKit

/*
 We can implement adapter pattern in two ways. The first one is object adapter which uses composition. There is an adaptee instance in adapter to do the job like the following figure and code tell us.
 */


//MARK: Adapter _ Approach 1 - Composition
protocol Target {
    func request()
}
class Adapter: Target {
    var adaptee: Adaptee
    init(adaptee: Adaptee) {
        self.adaptee = adaptee
    }
    func request() {
        adaptee.specificRequest()
    }
}
class Adaptee {
    func specificRequest() {
        print("Adapter -> Specific Request")
    }
}


//MARK: Adapter _ Approach 2 - Multiple Inheritance
protocol Target1 {
    func request()
}

class Adaptee1 {
    func specificRequest() {
        print("Adapter -> Specific Request")
    }
}

class Adapter1: Adaptee1, Target1 {
    func request() {
        specificRequest()
    }
}
