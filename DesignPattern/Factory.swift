//
//  Factory.swift
//  DesignPattern
//
//  Created by SENTHIL on 23/10/18.
//  Copyright © 2018 Personal. All rights reserved.
//


/*
 // Factory Design Pattern
1. It helps loose coupling by separating init & usage logic
2. Simple factory can be implemented in Swift using an enum and a switch-case
3. Use a protocol if you are planning to return different objects
*/

import UIKit

// Example 1
// Factory Method simple
class ColorFactory {
    
    enum Style {
        case text
        case background
    }
    
    func create(_ style: Style) -> UIColor {
        switch style {
        case .text:
            return .black
        case .background:
            return .white
        }
    }
}

// Example 2
// Factory Method with Protocol
protocol Environment {
    var identifier: String { get }
}

class DevEnvironment: Environment {
    var identifier: String { return "dev" }
}

class LiveEnvironment: Environment {
    var identifier: String { return "live" }
}

class EnvironmentFactory {
    
    enum EnvType {
        case dev
        case live
    }
    
    func create(_ type: EnvType) -> Environment {
        switch type {
        case .dev:
            return DevEnvironment()
        case .live:
            return LiveEnvironment()
        }
    }
}
