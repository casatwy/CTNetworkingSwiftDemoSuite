//
//  Event.extension.swift
//  CTNetworkingSwiftDemoSuite
//
//  Created by casa on 2020/2/28.
//  Copyright © 2020 casa. All rights reserved.
//

import Foundation

extension CTPagableAPIViewController {
    @objc func didTappedLoadNextPageButton() {
        statusLabel.text = "loading..."
        
        if apiManager?.isLastPage ?? false {
            statusLabel.text = "reached last page \(apiManager?.currentPageNumber ?? -1)"
        } else {
            apiManager?.loadNextPage()
            CTNetworkingSwiftAPIResultView.showInView(view)
        }
    }
    
    @objc func didTappedLoadFirstPageButton() {
        statusLabel.text = "loading..."
        apiManager?.loadData()
        CTNetworkingSwiftAPIResultView.showInView(view)
    }
}
