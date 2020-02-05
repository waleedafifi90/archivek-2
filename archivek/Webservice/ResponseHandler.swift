//
//  ResponseHandler.swift
//  archivek
//
//  Created by Waleed Afifi on 30/01/2020.
//  Copyright © 2020 Waleed Afifi. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ResponseHandler {
    static let shared = ResponseHandler()
    
    static func responseHandler(response: AFDataResponse<Data>, showLoader: Bool = true, request: BaseRequest, url: URL, success: @escaping ((_ json: JSON) -> Void), failure: @escaping ((_ error: Error) -> Void)) {
        debugPrint("****** Request Start ******")
        debugPrint("The Url: \(url.absoluteString)")
        RequestBuilder.showLoader(isShowLoader: false)
        switch response.result {
        case .success(let data):
            do {
                let json = try JSON.init(data: data)
                debugPrint("Method: \(request.method.rawValue)")
                debugPrint("Response \(json.dictionaryValue)")
                debugPrint("****** Request End ******")
                if json["status"]["success"].boolValue == true {
                    success(json)
                } else {
                    let error = NSError.init(domain: json["message"].stringValue, code: json["code"].intValue, userInfo: nil)
                    failure(error)
                }
            } catch(let error) {
                debugPrint(error.localizedDescription)
                failure(error)
            }
            break
        case .failure(let error):
            debugPrint(error.localizedDescription)
            failure(error)
            break
        }
    }
}
