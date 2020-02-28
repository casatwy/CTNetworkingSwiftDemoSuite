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
        apiManager?.loadData()
        CTNetworkingSwiftAPIResultView.showInView(view)
    }
    
    @objc func didTappedLoadFirstPageButton() {
        statusLabel.text = "loading..."
        guard let _apiManager = apiManager else { return }
        if _apiManager.isLastPage {
            statusLabel.text = "reached last page \(_apiManager.currentPageNumber)"
        } else {
            _apiManager.loadNextPage()
            CTNetworkingSwiftAPIResultView.showInView(view)
        }
    }
}
