//
//  Callback.pagable.extension.swift
//  CTNetworkingSwiftDemoSuite
//
//  Created by casa on 2020/2/28.
//  Copyright © 2020 casa. All rights reserved.
//

import Foundation
import CTNetworkingSwift

extension CTPagableAPIViewController:CTNetworkingAPIManagerCallbackDelegate {
    func requestDidSuccess(_ apiManager: CTNetworkingAPIManager) {
        guard let pagableAPIManager = apiManager as? CTNetworkingAPIManagerPagable else { return }

        if pagableAPIManager.isLastPage {
            statusLabel.text = "reached last page \(pagableAPIManager.currentPageNumber)"
        } else {
            statusLabel.text = "page \(pagableAPIManager.currentPageNumber) loaded"
        }
        
        guard let content = pagableAPIManager.response?.logString() else { return }
        CTNetworkingSwiftAPIResultView.config(content: content, in: view)
    }
    
    func requestDidFailed(_ apiManager: CTNetworkingAPIManager) {
        statusLabel.text = "fail"
        guard let content = apiManager.response?.logString() else { return }
        CTNetworkingSwiftAPIResultView.config(content: content, in: view)
    }
}
