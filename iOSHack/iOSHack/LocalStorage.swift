//
//  LocalStorage.swift
//  iOSHack
//
//  Created by Vinay Ganesh on 6/29/17.
//  Copyright © 2017 Vinay Ganesh. All rights reserved.
//

import Foundation

protocol LocalStorageProtocol {
    var counter: Int {get set}
}

struct LocalStorage: LocalStorageProtocol {

    private var userDefaults: UserDefaults {
        return UserDefaults.standard
    }

    var counter: Int {
        get {
            return userDefaults.integer(forKey: "LaunchCount")
        }
        set {
            userDefaults.set(newValue, forKey: "LaunchCount")
        }
    }
}
