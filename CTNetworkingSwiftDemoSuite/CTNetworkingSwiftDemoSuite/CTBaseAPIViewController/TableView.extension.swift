//
//  TableView.extension.swift
//  CTNetworkingSwiftDemoSuite
//
//  Created by casa on 2020/2/28.
//  Copyright © 2020 casa. All rights reserved.
//

import UIKit
import CTNetworkingSwift

extension CTBaseAPIViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: UITableViewDelegate
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let title = dataSource[indexPath.row][Constants.DataSource.kTitle] else { return }
        guard let detail = dataSource[indexPath.row][Constants.DataSource.kClass] else { return }
        guard let _cell = cell as? CTBaseAPITableViewCell else { return }
        _cell.config(title: title, detail: detail)
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let apiManagerClassName = dataSource[indexPath.row][Constants.DataSource.kClass] else { return }
        guard let apiManagerClass = NSClassFromString("\(apiManagerClassName)") as? NSObject.Type else { return }
        guard let apiManager = apiManagerClass.init() as? CTNetworkingAPIManager else { return }
        guard let paramSource = self as? CTNetworkingAPIManagerParamSource else { return }

        self.apiManager = apiManager
        apiManager.paramSource = paramSource
        apiManager.delegate = self
        
        if let pagableAPIManager = apiManager as? CTNetworkingAPIManagerPagable {
            let pagableViewController = CTPagableAPIViewController()
            pagableViewController.apiManager = pagableAPIManager
            navigationController?.pushViewController(pagableViewController, animated: true)
        } else {
            apiManager.loadData()
            CTNetworkingSwiftAPIResultView.showInView(view)
        }
    }
    
    // MARK: UITableViewDataSource
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    }
}
