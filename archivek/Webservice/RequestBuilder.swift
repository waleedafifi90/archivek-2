//
//  RequestBuilder.swift
//  archivek
//
//  Created by Waleed Afifi on 30/01/2020.
//  Copyright © 2020 Waleed Afifi. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import SVProgressHUD

class RequestBuilder {
    static let shared = RequestBuilder()
    static var headers: HTTPHeaders {
        var dic: HTTPHeaders = ["Authorization": "bearer \(UserProfile.shared.accessToken ?? "")"]
        dic["Content-Type"] = "application/x-www-form-urlencoded"
        return dic
    }
    
    private var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = AppDelegate.shared.rootNavigationViewController
        while parentResponder != nil {
            parentResponder = parentResponder?.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
    
    class func request(request: BaseRequest, showLoader: Bool = true, success: @escaping ((_ json: JSON) -> Void), failure: @escaping ((_ error: Error) -> Void)) {
        guard  let url = URL.init(string: request.BaseURL + request.url) else { return }
        if showLoader {
            self.showLoader(isShowLoader: true)
        }
        if request.files.count > 0 {
            AF.upload(multipartFormData: { (multipart) in
                for item in request.files {
                    if let data = item.data {
                        multipart.append(data, withName: item.name ?? "Data", fileName: item.fileName, mimeType: item.type.rawValue)
                    }
                }
                for (key, value) in request.parameters {
                    if let data = (value as AnyObject).data(using: String.Encoding.utf8.rawValue) {
                        multipart.append(data, withName: key)
                    }
                }
            }, to: url, method: request.method, headers: headers, interceptor: nil) .uploadProgress { progress in
                self.showLoader(inProgress: progress.fractionCompleted)
            }.responseData {response in
                ResponseHandler.responseHandler(response: response, showLoader: showLoader, request: request, url: url, success: success, failure: failure)
            }
        } else {
            AF.request(url, method: request.method, parameters: request.parameters, headers: headers, interceptor: nil).validate().responseData {
                (response) in
                ResponseHandler.responseHandler(response: response, showLoader: showLoader, request: request, url: url, success: success, failure: failure)
            }
        }
    }
    
    class func requestWithSuccessFullResponse(request: BaseRequest, showLoader: Bool = true, showErrorMessage: Bool = true, success: @escaping ((_ josn: JSON) -> Void)) {
        self.request(request: request, showLoader: showLoader, success: { (json) in
            success(json)
        }) { (error) in
            if showErrorMessage {
                RequestBuilder.shared.parentViewController?.showAlertPopUp(title: "Error!", message: error.localizedDescription, buttonAction1: {
                    
                }, buttonAction2: {
                    
                })
            }
        }
    }
    
    class func showLoader(isShowLoader: Bool) {
        if isShowLoader {
            SVProgressHUD.setDefaultMaskType(.custom)
            SVProgressHUD.setForegroundColor("cccccc".color_)
            SVProgressHUD.setBackgroundColor("ffffff".color_)
            SVProgressHUD.setOffsetFromCenter(UIOffset.init(horizontal: UIScreen.main.bounds.width / 2, vertical: UIScreen.main.bounds.height / 2))
            SVProgressHUD.show()
        } else {
            SVProgressHUD.dismiss()
        }
    }
    
    class func showLoader(inProgress: Double) {
        SVProgressHUD.setDefaultMaskType(.custom)
        SVProgressHUD.setForegroundColor(UIColor.hexColor(hex: "1E92C4"))
        SVProgressHUD.setBackgroundColor(UIColor.white)
        SVProgressHUD.showProgress(Float(inProgress))
    }

}
