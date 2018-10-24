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
        
        // Memento
        toUseMemento_Save()
        toUseMemento_Restore()
        
        // Factory Usage
        toUseFactory()
        toUseFactoryWithProtocol()
        
       // Abstract Factory
        toUseAbstractFactory()
        
        // Adapter
        toUseAdapterWithComposition()
        toUseAdapterWithMultipleInheritance()
        
        // Delegation
        toUseDelegation()

        // Observer
        toUseObserver()
        let observe = observerPattern(name:"Senthil")
        observe.updateMyName()
        
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

    //Factory With Protocol
    func toUseFactoryWithProtocol()  {
        
        let factory = EnvironmentFactory()
        let dev = factory.create(.dev)
        print("Factory2: \(dev.identifier)")
        
        let live = factory.create(.live)
        print("Factory2: \(live.identifier)")
        
    }
    
    //MARK: Memento
    func toUseMemento_Save() {

        _ =  User(name: "kumar", stateName: "nameKey")
    }
    
    func toUseMemento_Restore()  {
        let user = User(stateName: "nameKey")
        user.show()
    }
    
    
    //MARK: Abstract Factory
    func toUseAbstractFactory() {
        
        let factoryA = FactoryA()
        let compactSedan = factoryA.produceSedan()
        let compactSUV = factoryA.produceSUV()
        compactSedan.drive()
        compactSUV.drive()
        
        let factoryB = FactoryB()
        let fullSizeSedan = factoryB.produceSedan()
        let fullSizeSUV = factoryB.produceSUV()
        fullSizeSedan.drive()
        fullSizeSUV.drive()
    }
    
    //MARK: Adapter
    func toUseAdapterWithComposition()
    {
        let adaptee = Adaptee()
        let tar = Adapter(adaptee: adaptee)
        tar.request()
    }
    func toUseAdapterWithMultipleInheritance()
    {
        let adapter =  Adapter1()
        adapter.request()
    }
    
    
    //MARK: Delegation
    func toUseDelegation() {
        
        let manager = Manager()
        let employee = Employee()
        manager.delegate = employee
        manager.passAlong()
        
    }
    
    //MARK: Observer
    func toUseObserver() {
        // Receive Notification
        NotificationCenter.default.addObserver(self, selector:.notificationTapped, name:.notification_name, object: nil)
    }
    
    @objc func observerSample(notification:Notification) {
        
        print(notification.userInfo ?? "")
        if let dict = notification.userInfo as! [String:String]? {
            if (dict["name"]) != nil {
           let name = dict["name"]
                print("Observer -> \(String(describing: name! ))")
            }
        }
    }

    deinit {
        NotificationCenter.default.removeObserver(self, name:.notification_name, object: nil)
    }
    
    // @@@@@@@@@@@@@@@@@@@@@@@@@@@@@

}

