//
//  KVC.swift
//  DesignPattern
//
//  Created by SENTHIL on 29/10/18.
//  Copyright © 2018 Personal. All rights reserved.
//

import UIKit

class Children: NSObject {
    
    @objc dynamic var name : String
    @objc dynamic var age : Int
    
    override init() {
        self.name = ""
        self.age = 0
        super.init()
    }
    
}
