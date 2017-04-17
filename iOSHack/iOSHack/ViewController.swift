//
//  ViewController.swift
//  iOSHack
//
//  Created by Vinay Ganesh on 3/31/17.
//  Copyright © 2017 Vinay Ganesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var notifier: NotifyingProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        notifier = Notifier()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        notifier.addScreenTagNotification()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        notifier.removeScreenTagNotification()
    }
}
