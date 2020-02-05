//
//  Requests.swift
//  archivek
//
//  Created by Waleed Afifi on 03/02/2020.
//  Copyright © 2020 Waleed Afifi. All rights reserved.
//

import Foundation

class LoginRequest: BaseRequest {
    override func request(withURL url: String? = "login", withParameters parameters: [String : Any]? = [:], withRequestType type: BaseRequest.requestType = .post) -> BaseRequest {
        self.url = "login"
        self.method = .post
        self.parameters = parameters ?? [:]
        return self
    }
}

class HomeCategories: BaseRequest {
    override func request(withURL url: String? = "", withParameters parameters: [String : Any]? = [:], withRequestType type: BaseRequest.requestType = .list) -> BaseRequest {
        self.url = "categories"
        self.method = .get
        self.responseName = "constants"
        self.parameters = [:]
        return self
    }
}

class CategoryById: BaseRequest {
    override func request(withURL url: String? = "", withParameters parameters: [String : Any]? = [:], withRequestType type: BaseRequest.requestType = .list) -> BaseRequest {
        self.url = "categories/byId"
        self.method = .get
        self.responseName = "files"
        self.parameters = parameters ?? [:]
        return self
    }
}

class FileRequest:BaseRequest {
    override func request(withURL url: String? = "", withParameters parameters: [String : Any]? = [:], withRequestType type: BaseRequest.requestType = .list) -> BaseRequest {
        switch type {
        case .list:
            self.url = "files/list"
            self.method = .get
        case .post:
            self.url = "files/new"
            self.method = .post
            self.parameters = parameters ?? [:]
        case .delete:
            self.method = .delete
            self.parameters = parameters ?? [:]
        case .byid:
            self.method = .get
            self.parameters = parameters ?? [:]
            
        }
        self.responseName = "files"
        return self
    }
}

class ConstantRequest: BaseRequest {
    override func request(withURL url: String? = "", withParameters parameters: [String : Any]? = [:], withRequestType type: BaseRequest.requestType = .list) -> BaseRequest {
        self.url = "constants"
        self.parameters = parameters ?? [:]
        self.method = .get
        return self
    }
}

class SearchRequest: BaseRequest {
    override func request(withURL url: String? = "", withParameters parameters: [String : Any]? = [:], withRequestType type: BaseRequest.requestType = .list) -> BaseRequest {
        self.url = "search"
        self.parameters = parameters ?? [:]
        self.method = .get
        self.responseName = "files"
        return self
    }
}
