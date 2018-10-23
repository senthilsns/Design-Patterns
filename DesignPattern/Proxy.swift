//
//  Proxy.swift
//  DesignPattern
//
//  Created by SENTHIL on 18/10/18.
//  Copyright © 2018 Personal. All rights reserved.
//

import UIKit

protocol Car {
    
    func drive()
}

class Sedan: Car {
    
    func drive() {
        print("Proxy -> Drive a sedan")
    }
}

class AutonomousCar: Car {
    var car: Car
    
    // We need to pass a class name
    init(car: Car) {
        self.car = car
    }
    
    func drive() {
        car.drive()
        print("Proxy -> By self-driving system")
    }
    
}


