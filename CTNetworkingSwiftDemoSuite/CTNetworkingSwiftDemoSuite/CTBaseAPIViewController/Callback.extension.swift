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
        guard let contentString = apiManager.response?.logString() else { return }
        CTNetworkingSwiftAPIResultView.config(content: contentString, in: view)
    }
    
    func requestDidFailed(_ apiManager: CTNetworkingAPIManager) {
        guard let contentString = apiManager.response?.logString() else { return }
        CTNetworkingSwiftAPIResultView.config(content: contentString, in: view)
    }
}
