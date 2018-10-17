//
//  Facade.swift
//  DesignPattern
//
//  Created by SENTHIL on 17/10/18.
//  Copyright © 2018 Personal. All rights reserved.
//

import UIKit

//MARK: Complex Sub System
// Sub System 1
class Engine {
    func produceEngine() {
        print("Facade -> prodce engine")
    }
}

// Sub System 2
class Body {
    func produceBody() {
        print("Facade -> prodce body")
    }
}

// Sub System 3
class Accessories {
    func produceAccessories() {
        print("Facade -> prodce accessories")
    }
}


//MARK: Simple Interface
class FactoryFacade {
    let engine = Engine()
    let body = Body()
    let accessories = Accessories()
    func produceCar() {
        engine.produceEngine()
        body.produceBody()
        accessories.produceAccessories()
    }
}
