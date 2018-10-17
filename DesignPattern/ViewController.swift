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
    

}

