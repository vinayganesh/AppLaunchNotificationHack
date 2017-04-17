//
//  iOSHackTests.swift
//  iOSHackTests
//
//  Created by Vinay Ganesh on 3/31/17.
//  Copyright © 2017 Vinay Ganesh. All rights reserved.
//

import XCTest
@testable import iOSHack

class iOSHackTests: XCTestCase {

    class MockNotfier: NotifyingProtocol {
        var notificationAdded = false
        func addScreenTagNotification() {
            notificationAdded = true
        }
        
        func removeScreenTagNotification() {
            notificationAdded = false
        }
    }
    
    func testNotificationAdded() {
        let controller = ViewController()
        let mockNotifier = MockNotfier()
        controller.notifier = mockNotifier
        controller.viewWillAppear(true)
        XCTAssertTrue(mockNotifier.notificationAdded)
    }

    func testNotificationRemoved() {
        let controller = ViewController()
        let mockNotifier = MockNotfier()
        controller.notifier = mockNotifier
        controller.viewWillDisappear(true)
        XCTAssertFalse(mockNotifier.notificationAdded)
    }
}
