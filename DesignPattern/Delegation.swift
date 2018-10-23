//
//  Delegation.swift
//  DesignPattern
//
//  Created by SENTHIL on 23/10/18.
//  Copyright © 2018 Personal. All rights reserved.
//

import UIKit

//MARK: Delegation
protocol Work: class {
    func doSomething()
}

class Manager {
    weak var delegate: Work?
    func passAlong() {
        delegate?.doSomething()
    }
}

class Employee: Work {
    func doSomething() {
        print("Delegation -> Working on it")
    }
}

