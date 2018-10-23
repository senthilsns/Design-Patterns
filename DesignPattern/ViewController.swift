//
//  ViewController.swift
//  DesignPattern
//
//  Created by SENTHIL on 17/10/18.
//  Copyright © 2018 Personal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Sigleton Usage
        ToUseSingleton()
   
        // Facade Usage
        ToUseFacade()
        
        // Proxy Usage
        ToUseProxy()
        
        // Factory Usage
        toUseFactory()
        toUseFactoryWithProtocol()
        
        // Memento
        toUseMemento_Save()
        toUseMemento_Restore()
        
    }

    //MARK: Singleton
    func ToUseSingleton() {
        
        LocationManager.shared.requestForLocation()
    }
    
    //MARK: Facade
    func ToUseFacade() {
        
        let factoryFacade = FactoryFacade()
        factoryFacade.produceCar()
    }
    
    //MARK: Proxy
    func ToUseProxy() {

        let sedan = Sedan()
        let autonomousCar = AutonomousCar(car: sedan)
        autonomousCar.drive()
        
    }
    
    //MARK: Factory
    func toUseFactory() {
        
        let factory = ColorFactory()
        let textColor = factory.create(.text)
        let backgroundColor = factory.create(.background)
        print("Factory1 : -> \(textColor) \(backgroundColor)")
        
    }

    //MARK: Factory With Protocol
    func toUseFactoryWithProtocol()  {
        
        let factory = EnvironmentFactory()
        let dev = factory.create(.dev)
        print("Factory2: \(dev.identifier)")
        
        let live = factory.create(.live)
        print("Factory2: \(live.identifier)")
        
    }
    
    //MARK: Memento
    func toUseMemento_Save() {
        
        let user = User(name: "kumar", stateName: "nameKey")
        user.show()
    }
    
    func toUseMemento_Restore()  {
        let user = User(stateName: "nameKey")
        user.show()
    }
    
}

