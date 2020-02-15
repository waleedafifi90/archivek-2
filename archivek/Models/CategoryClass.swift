//
//  CategoryClass.swift
//  archivek
//
//  Created by Waleed Afifi on 10/02/2020.
//  Copyright © 2020 Waleed Afifi. All rights reserved.
//

import Foundation
import SwiftyJSON


class CategoryClass : NSObject, NSCoding{

    var pkIId : Int?
    var iOrginalId : Int?
    var sKey : String?
    var sValue : String?
    var sImage : String?
    var iFilesCount : Int?
    var fkIParentId : Int?
    var sExtra1 : String?
    var sExtra2 : String?
    var sExtra3 : String?
    var sExtra4 : String?
    var bEnabled : Bool?
    var dtCreatedDate : String?
    var dtModifiedDate : String?
    var dtDeletedDate : String?

    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init?(fromJson json: JSON?){
        if json!.isEmpty{
            return
        }
        pkIId = json?["pk_i_id"].intValue
        iOrginalId = json?["i_orginal_id"].intValue
        sKey = json?["s_key"].stringValue
        sValue = json?["s_value"].stringValue
        sImage = json?["s_image"].stringValue
        iFilesCount = json?["i_files_count"].intValue
        fkIParentId = json?["fk_i_parent_id"].intValue
        sExtra1 = json?["s_extra_1"].stringValue
        sExtra2 = json?["s_extra_2"].stringValue
        sExtra3 = json?["s_extra_3"].stringValue
        sExtra4 = json?["s_extra_4"].stringValue
        bEnabled = json?["b_enabled"].boolValue
        dtCreatedDate = json?["dt_created_date"].stringValue
        dtModifiedDate = json?["dt_modified_date"].stringValue
        dtDeletedDate = json?["dt_deleted_date"].stringValue
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if pkIId != nil{
            dictionary["pk_i_id"] = pkIId
        }
        if iOrginalId != nil{
            dictionary["i_orginal_id"] = iOrginalId
        }
        if sKey != nil{
            dictionary["s_key"] = sKey
        }
        if sValue != nil{
            dictionary["s_value"] = sValue
        }
        if sImage != nil{
            dictionary["s_image"] = sImage
        }
        if iFilesCount != nil{
            dictionary["i_files_count"] = iFilesCount
        }
        if fkIParentId != nil{
            dictionary["fk_i_parent_id"] = fkIParentId
        }
        if sExtra1 != nil{
            dictionary["s_extra_1"] = sExtra1
        }
        if sExtra2 != nil{
            dictionary["s_extra_2"] = sExtra2
        }
        if sExtra3 != nil{
            dictionary["s_extra_3"] = sExtra3
        }
        if sExtra4 != nil{
            dictionary["s_extra_4"] = sExtra4
        }
        if bEnabled != nil{
            dictionary["b_enabled"] = bEnabled
        }
        if dtCreatedDate != nil{
            dictionary["dt_created_date"] = dtCreatedDate
        }
        if dtModifiedDate != nil{
            dictionary["dt_modified_date"] = dtModifiedDate
        }
        if dtDeletedDate != nil{
            dictionary["dt_deleted_date"] = dtDeletedDate
        }
        return dictionary
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
        pkIId = aDecoder.decodeObject(forKey: "pk_i_id") as? Int
        iOrginalId = aDecoder.decodeObject(forKey: "i_orginal_id") as? Int
        sKey = aDecoder.decodeObject(forKey: "s_key") as? String
        sValue = aDecoder.decodeObject(forKey: "s_value") as? String
        sImage = aDecoder.decodeObject(forKey: "s_image") as? String
        iFilesCount = aDecoder.decodeObject(forKey: "i_files_count") as? Int
        fkIParentId = aDecoder.decodeObject(forKey: "fk_i_parent_id") as? Int
        sExtra1 = aDecoder.decodeObject(forKey: "s_extra_1") as? String
        sExtra2 = aDecoder.decodeObject(forKey: "s_extra_2") as? String
        sExtra3 = aDecoder.decodeObject(forKey: "s_extra_3") as? String
        sExtra4 = aDecoder.decodeObject(forKey: "s_extra_4") as? String
        bEnabled = aDecoder.decodeObject(forKey: "b_enabled") as? Bool
        dtCreatedDate = aDecoder.decodeObject(forKey: "dt_created_date") as? String
        dtModifiedDate = aDecoder.decodeObject(forKey: "dt_modified_date") as? String
        dtDeletedDate = aDecoder.decodeObject(forKey: "dt_deleted_date") as? String
    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
    {
        if pkIId != nil{
            aCoder.encode(pkIId, forKey: "pk_i_id")
        }
        if iOrginalId != nil{
            aCoder.encode(iOrginalId, forKey: "i_orginal_id")
        }
        if sKey != nil{
            aCoder.encode(sKey, forKey: "s_key")
        }
        if sValue != nil{
            aCoder.encode(sValue, forKey: "s_value")
        }
        if sImage != nil{
            aCoder.encode(sImage, forKey: "s_image")
        }
        if iFilesCount != nil{
            aCoder.encode(iFilesCount, forKey: "i_files_count")
        }
        if fkIParentId != nil{
            aCoder.encode(fkIParentId, forKey: "fk_i_parent_id")
        }
        if sExtra1 != nil{
            aCoder.encode(sExtra1, forKey: "s_extra_1")
        }
        if sExtra2 != nil{
            aCoder.encode(sExtra2, forKey: "s_extra_2")
        }
        if sExtra3 != nil{
            aCoder.encode(sExtra3, forKey: "s_extra_3")
        }
        if sExtra4 != nil{
            aCoder.encode(sExtra4, forKey: "s_extra_4")
        }
        if bEnabled != nil{
            aCoder.encode(bEnabled, forKey: "b_enabled")
        }
        if dtCreatedDate != nil{
            aCoder.encode(dtCreatedDate, forKey: "dt_created_date")
        }
        if dtModifiedDate != nil{
            aCoder.encode(dtModifiedDate, forKey: "dt_modified_date")
        }
        if dtDeletedDate != nil{
            aCoder.encode(dtDeletedDate, forKey: "dt_deleted_date")
        }

    }

}
