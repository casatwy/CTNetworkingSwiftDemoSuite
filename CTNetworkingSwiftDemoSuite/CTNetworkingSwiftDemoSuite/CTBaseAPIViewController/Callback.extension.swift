//
//  Callback.extension.swift
//  CTNetworkingSwiftDemoSuite
//
//  Created by casa on 2020/2/28.
//  Copyright © 2020 casa. All rights reserved.
//

import CTNetworkingSwift

extension CTBaseAPIViewController: CTNetworkingAPIManagerCallbackDelegate {
    func requestDidSuccess(_ apiManager: CTNetworkingAPIManager) {
    }
    
    func requestDidFailed(_ apiManager: CTNetworkingAPIManager) {
    }
}
