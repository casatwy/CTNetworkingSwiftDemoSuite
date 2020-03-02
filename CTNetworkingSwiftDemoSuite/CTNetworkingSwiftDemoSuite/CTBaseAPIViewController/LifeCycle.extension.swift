//
//  LifeCycle.extension.swift
//  CTNetworkingSwiftDemoSuite
//
//  Created by casa on 2020/2/28.
//  Copyright © 2020 casa. All rights reserved.
//

import UIKit
import SwiftHandyFrame

extension CTBaseAPIViewController {
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        view.backgroundColor = .white
    }

    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.hf.fill()
    }
}
