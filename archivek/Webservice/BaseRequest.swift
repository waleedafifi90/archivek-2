//
//  BaseRequest.swift
//  archivek
//
//  Created by Waleed Afifi on 30/01/2020.
//  Copyright © 2020 Waleed Afifi. All rights reserved.
//

import Foundation
import Alamofire

class BaseRequest {
    static var shared = BaseRequest()
    let BaseURL: String = "https://newline.website/archivek_dev/api/api/v1/"
    var url: String = ""
    var parameters: [String: Any] = [:]
    var method: HTTPMethod = .get
    var files: [BaseFile] = []
    
    enum requestType {
        case list, post, delete, byid
    }
    var responseName: String = ""
    var pageNo: Int = 1
    var type: requestType = .list
    var urlParameters: [String: Any] {
        return [:]
    }
    var pageNumber: Int {
        return pageNo
    }
    
    func request(withURL url: String? = "", withParameters parameters: [String: Any]? = [:], withRequestType type: requestType = .list) -> BaseRequest {
        return self
    }
}
