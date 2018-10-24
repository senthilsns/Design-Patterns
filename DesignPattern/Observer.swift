//
//  Observer.swift
//  DesignPattern
//
//  Created by SENTHIL on 24/10/18.
//  Copyright © 2018 Personal. All rights reserved.
//

import UIKit

class observerPattern {
    
    var name: String
    init(name:String) {
        self.name = name
    }
    
    func updateMyName() {
        NotificationCenter.default.post(name:.notification_name, object: self, userInfo: ["name":"\(name)"])
        print("Observable -> \(name) got Posted")
    }

}


extension Notification.Name {
    
    static let notification_name = Notification.Name("UserName")
    static let notification_password = Notification.Name("PassWord")
}

extension Selector {
    static let notificationTapped = #selector(ViewController.observerSample(notification:))
}
