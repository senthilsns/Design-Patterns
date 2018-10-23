//
//  AbstractFactory.swift
//  DesignPattern
//
//  Created by SENTHIL on 23/10/18.
//  Copyright © 2018 Personal. All rights reserved.
//


/*
 The abstract factory pattern provides a way to encapsulate a group of individual factories that have a common theme without specifying their concrete classes.It handles a little more complex use case.
 */

import UIKit

/*
  The sedan family has different models like compact, mid-size and full-size.SUV has same categories. Let’s assume we have two factories. One is focused on compact types and the other is on full size. As the following figure tells us, factory A produces compact sedan and compact SUV. Factory B produces full-size sedan and SUV.
*/

protocol Sedan1 {
    func drive()
}
class CompactSedan: Sedan1 {
    func drive() {
        print("drive a compact sedan")
    }
}
class MidSizeSedan: Sedan1 {
    func drive() {
        print("drive a mid-size sedan")
    }
}
class FullSizeSedan: Sedan1 {
    func drive() {
        print("drive a full-size sedan")
    }
}



protocol SUV {
    func drive()
}
class CompactSUV: SUV {
    func drive() {
        print("drive a compact SUV")
    }
}
class MidSizeSUV: SUV {
    func drive() {
        print("drive a mid-size SUV")
    }
}
class FullSizeSUV: SUV {
    func drive() {
        print("drive a full-size SUV")
    }
}



protocol Factory {
    func produceSedan() -> Sedan1
    func produceSUV() -> SUV
}

class FactoryA: Factory {
    func produceSedan() -> Sedan1{
        return CompactSedan()
    }
    func produceSUV() -> SUV {
        return CompactSUV()
    }
}

class FactoryB: Factory {
    
    func produceSedan() -> Sedan1 {
        return FullSizeSedan()
    }
    func produceSUV() -> SUV {
        return FullSizeSUV()
    }
}
