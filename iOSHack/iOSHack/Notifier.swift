//
//  Notifier.swift
//  iOSHack
//
//  Created by Vinay Ganesh on 3/31/17.
//  Copyright © 2017 Vinay Ganesh. All rights reserved.
//

import Foundation

protocol NotifyingProtocol {
    func addScreenTagNotification()
    func removeScreenTagNotification()
}

class Notifier: NotifyingProtocol {
    private var isScreenAlreadyTagged = false
    private let DID_BECOME_ACTIVE = Notification.Name.UIApplicationDidBecomeActive
    private let DID_ENTER_BACKGROUND = Notification.Name.UIApplicationDidEnterBackground
    private var localStorage: LocalStorageProtocol!

    init(localStorage: LocalStorageProtocol = LocalStorage()) {
        self.localStorage = localStorage
    }

    @objc private func handleLaunch() {
        if !isScreenAlreadyTagged {
            print("Screen tag goes here!")
            localStorage.counter = localStorage.counter + 1
            isScreenAlreadyTagged = true
            print("screen lauch count is \(localStorage.counter)")
        }
    }

    @objc private func handleInactivity() {
        isScreenAlreadyTagged = false
    }

    func addScreenTagNotification() {
        NotificationCenter.default.addObserver(self, selector:#selector(handleLaunch) ,
                                               name:DID_BECOME_ACTIVE,
                                               object: nil)
        NotificationCenter.default.addObserver(self, selector:#selector(handleInactivity) ,
                                               name:DID_ENTER_BACKGROUND,
                                               object: nil)
    }

    func removeScreenTagNotification() {
        NotificationCenter.default.removeObserver(DID_BECOME_ACTIVE)
        NotificationCenter.default.removeObserver(DID_ENTER_BACKGROUND)
    }
}
