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
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.textLabel?.text = dataSource[indexPath.row][Constants.DataSource.kTitle]
        cell.detailTextLabel?.text = dataSource[indexPath.row][Constants.DataSource.kClass]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let apiManagerClassName = dataSource[indexPath.row][Constants.DataSource.kClass] else { return }
        guard let apiManagerClass = NSClassFromString(apiManagerClassName) else { return }
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    }
}
