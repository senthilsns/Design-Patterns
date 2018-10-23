//
//  Memento.swift
//  DesignPattern
//
//  Created by SENTHIL on 23/10/18.
//  Copyright © 2018 Personal. All rights reserved.
//

/*
 In Memento Pattern saves your stuff somewhere. Later on, this externalized state can be restored without violating encapsulation; that is, private data remains private. Implementations example of the Memento pattern is Archiving, Serialization and State Restoration.  */

import UIKit

protocol Memento : class {
    
    // Key for accessing the "state" property
    // from UserDefaults.
    var stateName: String { get }
    
    // Current state of adopting class -- all
    // property names (keys) and property values.
    var state: Dictionary<String, String> { get set }
    
    // Save "state" property with key as specified
    // in "stateName" into UserDefaults ("generic" save).
    func save()
    
    // Retrieve "state" property using key as specified
    // in "stateName" from UserDefaults ("generic" restore).
    func restore()
    
    // Customized, "specific" save of "state" dictionary with
    // keys corresponding to member properties of adopting
    // class, and save of each property value (class-specific).
    func persist()
    
    // Customized, "specific" retrieval of "state" dictionary using
    // keys corresponding to member properties of adopting
    // class, and retrieval of each property value  (class-specific).
    func recover()
    
    // Print all adopting class's member properties by
    // traversing "state" dictionary, so output is of
    // format:
    //
    // Property 1 name (key): property 1 value
    // Property 2 name (key): property 2 value ...
    func show()
    
}


extension Memento {
    
    // Save state into dictionary archived on disk.
    func save() {
        UserDefaults.standard.set(state, forKey: stateName)
    }
    
    // Read state into dictionary archived on disk.
    func restore() {
        
        if let dictionary = UserDefaults.standard.object(forKey: stateName) as! Dictionary<String, String>? {
            state = dictionary
        }
        else {
            state.removeAll()
        }
        
    }
    
    // Storing state in dictionary makes display
    // of object state so easy and intuitive.
    func show() {

        var line = ""
        if state.count > 0 {
            for (key, value) in state {
                line += key + ": " + value + "\n"
            }
            print("Memento -> \(line)")
        } else {
            print("Empty entity.\n")
        }
    }
}



// By adopting the Memento protocol, we can, with relative
// ease, save the state of an entire class to persistant
// storage and then retrieve that state at a later time, i.e.,
// across different instances of this app running.
class User: Memento {
    
    // These two properties are required by Memento.
    let stateName: String
    var state: Dictionary<String, String>
    
    // These properties are specific to a class that
    // represents some kind of system user account.
    var name: String
    
    // Initializer for persisting a new user to disk, or for
    // updating an existing user. The key value used for accessing
    // persistent storage is property "stateName."
    init(name: String, stateName: String) {
        
        self.name = name
        self.stateName = stateName
        self.state = Dictionary<String, String>()
        persist()
        
    }
    
    // Initializer for retrieving a user from disk, if one
    // exists. The key value used for retrieving state from
    // persistent storage is property "stateName."
    init(stateName: String) {
        
        self.stateName = stateName
        self.state = Dictionary<String, String>()
        
        self.name = ""
        recover()
        
    }
    
    // Save the user's properties to persistent storage.
    // We intuitively save each property value by making
    // the keys in the dictionary correspond one-to-one with
    // this class's property names.
    func persist() {
        
        state["name"] = name
        save() // leverage protocol extension
        
    }
    
    // Read existing user's properties from persistent storage.
    // After retrieving the "state" dictionary from UserDefaults,
    // we easily restore each property value because
    // the keys in the dictionary correspond one-to-one with
    // this class's property names.
    func recover() {
        
        restore() // leverage protocol extension
        
        if state.count > 0 {
            name = state["name"]!
        }
        else {
            self.name = ""
        }
    }
}

