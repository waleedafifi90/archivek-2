//
//  GeneralTableView.swift
//  archivek
//
//  Created by Waleed Afifi on 30/01/2020.
//  Copyright © 2020 Waleed Afifi. All rights reserved.
//

import UIKit
import SwiftyJSON

class GeneralTableView: UITableView {
    
    private var identifier: String = ""
    private var request: BaseRequest = BaseRequest()
    var req: BaseRequest = BaseRequest()
    typealias emptyClosuer = (() -> Void)
    typealias jsonClouser = ((_ json: JSON) -> [Any])?
    private var didFinish: emptyClosuer?
    var cellIdentifier: String = ""
    var objects: [GeneralTableViewData] = []
    
    var generalRowHeight: CGFloat = 80
    var emptyDataImage: UIImage? = UIImage()
    var emptyDataTitle: String = ""
    var emptyDataTitleFont: UIFont = .systemFont(ofSize: 14)
    var emptyDataTitleColor: UIColor = .gray
    var isShowLoaderWhileRequest: Bool = false
    var isShowErrorMessage: Bool = false
    
    var pageNumber: Int = 1
    var totalPage: Int = 1
    
    var isRefresh: Bool = false {
        didSet {
            let refControll = UIRefreshControl()
            refControll.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
            self.refreshControl = refControll
        }
    }
    
    var isLoadMore: Bool = false {
        didSet {
            self.perform(#selector(loadTable), with: self, afterDelay: 0.3)
        }
    }
    
    var load: Bool = false {
        didSet {
            self.perform(#selector(loadTable), with: self, afterDelay: 0.3)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.delegate = self
        self.dataSource = self
    }
    
    func didFinishRequest(_ didFinishParameter: emptyClosuer?) -> GeneralTableView {
        self.didFinish = didFinishParameter
        return self
    }
    
    
    @objc func pullToRefresh() {
        self.pageNumber = 1
        self.objects.removeAll()
        self.reloadData()
        self.loadTable()
    }
}

extension GeneralTableView {
    func withIdentifier(identifier: String) -> GeneralTableView {
        self.identifier = identifier
        return self
    }
    
    func withRequest(request: BaseRequest) -> GeneralTableView {
        self.request = request
        return self
    }
    
    func buildData(objs: [Any]?) {
        for item in objs ?? [] {
            self.objects.append(GeneralTableViewData(identifier: identifier, object: item, height: nil))
        }
        self.reloadData()
        self.didFinish?()
    }
    
    func buildRequest(jsonClouser: jsonClouser) -> GeneralTableView {
        RequestBuilder.requestWithSuccessFullResponse(request: request, showLoader: isShowLoaderWhileRequest, showErrorMessage: isShowErrorMessage) { (json) in
            self.buildData(objs: jsonClouser?(json))
        }
        return self
    }
    
    func registerNib(withIdentifier identifier: [String]) {
        for id in identifier {
            self.register(UINib(nibName: id, bundle: nil), forCellReuseIdentifier: id)
        }
    }
    
    @objc func loadTable() {
        req.pageNo = self.pageNumber
        RequestBuilder.requestWithSuccessFullResponse(request: req) { (json) in
            self.totalPage = 1
            for item in json[self.req.responseName].arrayObject! {
                self.objects.append(GeneralTableViewData(identifier: self.cellIdentifier, object: item, height: nil))
            }
            self.reloadData()
            self.refreshControl?.endRefreshing()
            self.tableFooterView?.isHidden = true
        }
    }
}

extension GeneralTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let obj = self.objects[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: obj.identifier, for: indexPath) as! GeneralTableViewCell
        cell.object = obj
        cell.indexPath = indexPath
        cell.parentVC = self.parentViewController
        cell.configureCell()
        return cell
    }
}

extension GeneralTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! GeneralTableViewCell
        cell.cellDelegate.tableView(tableView, didSelectRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let obj = objects[indexPath.row]
        if obj.rowHeight != nil {
            return obj.rowHeight ?? generalRowHeight
        } else {
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cl = cell as! GeneralTableViewCell
        cl.cellDelegate.tableView(tableView, willDisplay: cell, forRowAt: indexPath)
        
        if isLoadMore {
            if self.pageNumber < self.totalPage {
                if indexPath.row == self.objects.count - 1 {
                    self.pageNumber += 1
                    self.showLoading()
                    self.perform(#selector(loadTable), with: self, afterDelay: 0.3)
                }
            }
        }
    }
}
