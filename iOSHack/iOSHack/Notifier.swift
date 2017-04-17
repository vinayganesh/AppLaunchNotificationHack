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

class Notifier: NSObject, NotifyingProtocol {
    var isScreenAlreadyTagged = false

    @objc private func handleLaunch() {
        if !isScreenAlreadyTagged {
            print("Screen tag goes here!")
            isScreenAlreadyTagged = true
        }
    }

    @objc private func handleInactivity() {
        isScreenAlreadyTagged = false
    }

    func addScreenTagNotification() {
        NotificationCenter.default.addObserver(self, selector:#selector(handleLaunch) ,
                                               name:NSNotification.Name.UIApplicationWillEnterForeground,
                                               object: nil)
        NotificationCenter.default.addObserver(self, selector:#selector(handleLaunch) ,
                                               name:NSNotification.Name.UIApplicationDidBecomeActive,
                                               object: nil)
        NotificationCenter.default.addObserver(self, selector:#selector(handleInactivity) ,
                                               name:NSNotification.Name.UIApplicationWillResignActive,
                                               object: nil)
        NotificationCenter.default.addObserver(self, selector:#selector(handleInactivity) ,
                                               name:NSNotification.Name.UIApplicationDidEnterBackground,
                                               object: nil)
    }

    func removeScreenTagNotification() {
        NotificationCenter.default.removeObserver(NSNotification.Name.UIApplicationWillEnterForeground)
        NotificationCenter.default.removeObserver(NSNotification.Name.UIApplicationDidBecomeActive)
        NotificationCenter.default.removeObserver(NSNotification.Name.UIApplicationWillResignActive)
        NotificationCenter.default.removeObserver(NSNotification.Name.UIApplicationDidEnterBackground)
    }
}
