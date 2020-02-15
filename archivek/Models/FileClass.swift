//
//  FileClass.swift
//  archivek
//
//  Created by Waleed Afifi on 10/02/2020.
//  Copyright © 2020 Waleed Afifi. All rights reserved.
//

import Foundation
import SwiftyJSON

class FileClass : NSObject, NSCoding{

    var pkIId : Int?
    var sName : String?
    var sImage : String?
    var fkIParentId : Int?
    var sFilesCount : Int?
    var sExtra1 : String?
    var sExtra2 : String?
    var sExtra3 : String?
    var sExtra4 : String?
    var sFileNumber : String?
    var sDescription : String?
    var sExtension : String?
    var sFile : String?
    var sFileLogo : String?
    var fkITypeId : Int?
    var sTypeName : String?
    var fkIUserId : Int?
    var sNotes : String?
    var bSecret : Bool?
    var fkIExtensionId : Int?
    var sExtensionName : String?
    var fkICategoryId : Int?
    var sCategoryName : String?
    var fkIProjectId : Int?
    var sProjectName : String?
    var bDeletedSeen : Bool?
    var sAttachments : [String]?
    var dtFileDate : String?
    var sType : String?
    var bEnabled : Bool?
    var dtCreatedDate : String?
    var dtModifiedDate : String?
    var dtDeletedDate : String?

    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init?(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        pkIId = json["pk_i_id"].intValue
        sName = json["s_name"].stringValue
        sImage = json["s_image"].stringValue
        fkIParentId = json["fk_i_parent_id"].intValue
        sFilesCount = json["i_files_count"].intValue
        sExtra1 = json["s_extra_1"].stringValue
        sExtra2 = json["s_extra_2"].stringValue
        sExtra3 = json["s_extra_3"].stringValue
        sExtra4 = json["s_extra_4"].stringValue
        sFileNumber = json["s_file_number"].stringValue
        sDescription = json["s_description"].stringValue
        sExtension = json["s_extension"].stringValue
        sFile = json["s_file"].stringValue
        sFileLogo = json["s_file_logo"].stringValue
        fkITypeId = json["fk_i_type_id"].intValue
        sTypeName = json["s_type_name"].stringValue
        fkIUserId = json["fk_i_user_id"].intValue
        sNotes = json["s_notes"].stringValue
        bSecret = json["b_secret"].boolValue
        fkIExtensionId = json["fk_i_extension_id"].intValue
        sExtensionName = json["s_extension_name"].stringValue
        fkICategoryId = json["fk_i_category_id"].intValue
        sCategoryName = json["s_category_name"].stringValue
        fkIProjectId = json["fk_i_project_id"].intValue
        sProjectName = json["s_project_name"].stringValue
        bDeletedSeen = json["b_deleted_seen"].boolValue
        sAttachments = [String]()
        let sAttachmentsArray = json["s_attachments"].arrayValue
        for sAttachmentsJson in sAttachmentsArray{
            sAttachments?.append(sAttachmentsJson.stringValue)
        }
        dtFileDate = json["dt_file_date"].stringValue
        sType = json["s_type"].stringValue
        bEnabled = json["b_enabled"].boolValue
        dtCreatedDate = json["dt_created_date"].stringValue
        dtModifiedDate = json["dt_modified_date"].stringValue
        dtDeletedDate = json["dt_deleted_date"].stringValue
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
        if sName != nil{
            dictionary["s_name"] = sName
        }
        if sImage != nil{
            dictionary["s_image"] = sImage
        }
        if fkIParentId != nil{
            dictionary["fk_i_parent_id"] = fkIParentId
        }
        if sFilesCount != nil{
            dictionary["i_files_count"] = sFilesCount
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
        if sFileNumber != nil{
            dictionary["s_file_number"] = sFileNumber
        }
        if sDescription != nil{
            dictionary["s_description"] = sDescription
        }
        if sExtension != nil{
            dictionary["s_extension"] = sExtension
        }
        if sFile != nil{
            dictionary["s_file"] = sFile
        }
        if sFileLogo != nil{
            dictionary["s_file_logo"] = sFileLogo
        }
        if fkITypeId != nil{
            dictionary["fk_i_type_id"] = fkITypeId
        }
        if sTypeName != nil{
            dictionary["s_type_name"] = sTypeName
        }
        if fkIUserId != nil{
            dictionary["fk_i_user_id"] = fkIUserId
        }
        if sNotes != nil{
            dictionary["s_notes"] = sNotes
        }
        if bSecret != nil{
            dictionary["b_secret"] = bSecret
        }
        if fkIExtensionId != nil{
            dictionary["fk_i_extension_id"] = fkIExtensionId
        }
        if sExtensionName != nil{
            dictionary["s_extension_name"] = sExtensionName
        }
        if fkICategoryId != nil{
            dictionary["fk_i_category_id"] = fkICategoryId
        }
        if sCategoryName != nil{
            dictionary["s_category_name"] = sCategoryName
        }
        if fkIProjectId != nil{
            dictionary["fk_i_project_id"] = fkIProjectId
        }
        if sProjectName != nil{
            dictionary["s_project_name"] = sProjectName
        }
        if bDeletedSeen != nil{
            dictionary["b_deleted_seen"] = bDeletedSeen
        }
        if sAttachments != nil{
            dictionary["s_attachments"] = sAttachments
        }
        if dtFileDate != nil{
            dictionary["dt_file_date"] = dtFileDate
        }
        if sType != nil{
            dictionary["s_type"] = sType
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
        sName = aDecoder.decodeObject(forKey: "s_name") as? String
        sImage = aDecoder.decodeObject(forKey: "s_image") as? String
        fkIParentId = aDecoder.decodeObject(forKey: "fk_i_parent_id") as? Int
        sFilesCount = aDecoder.decodeObject(forKey: "i_files_count") as? Int
        sExtra1 = aDecoder.decodeObject(forKey: "s_extra_1") as? String
        sExtra2 = aDecoder.decodeObject(forKey: "s_extra_2") as? String
        sExtra3 = aDecoder.decodeObject(forKey: "s_extra_3") as? String
        sExtra4 = aDecoder.decodeObject(forKey: "s_extra_4") as? String
        sFileNumber = aDecoder.decodeObject(forKey: "s_file_number") as? String
        sDescription = aDecoder.decodeObject(forKey: "s_description") as? String
        sExtension = aDecoder.decodeObject(forKey: "s_extension") as? String
        sFile = aDecoder.decodeObject(forKey: "s_file") as? String
        sFileLogo = aDecoder.decodeObject(forKey: "s_file_logo") as? String
        fkITypeId = aDecoder.decodeObject(forKey: "fk_i_type_id") as? Int
        sTypeName = aDecoder.decodeObject(forKey: "s_type_name") as? String
        fkIUserId = aDecoder.decodeObject(forKey: "fk_i_user_id") as? Int
        sNotes = aDecoder.decodeObject(forKey: "s_notes") as? String
        bSecret = aDecoder.decodeObject(forKey: "b_secret") as? Bool
        fkIExtensionId = aDecoder.decodeObject(forKey: "fk_i_extension_id") as? Int
        sExtensionName = aDecoder.decodeObject(forKey: "s_extension_name") as? String
        fkICategoryId = aDecoder.decodeObject(forKey: "fk_i_category_id") as? Int
        sCategoryName = aDecoder.decodeObject(forKey: "s_category_name") as? String
        fkIProjectId = aDecoder.decodeObject(forKey: "fk_i_project_id") as? Int
        sProjectName = aDecoder.decodeObject(forKey: "s_project_name") as? String
        bDeletedSeen = aDecoder.decodeObject(forKey: "b_deleted_seen") as? Bool
        sAttachments = aDecoder.decodeObject(forKey: "s_attachments") as? [String]
        dtFileDate = aDecoder.decodeObject(forKey: "dt_file_date") as? String
        sType = aDecoder.decodeObject(forKey: "s_type") as? String
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
        if sName != nil{
            aCoder.encode(sName, forKey: "s_name")
        }
        if sImage != nil{
            aCoder.encode(sImage, forKey: "s_image")
        }
        if fkIParentId != nil{
            aCoder.encode(fkIParentId, forKey: "fk_i_parent_id")
        }
        if sFilesCount != nil{
            aCoder.encode(sFilesCount, forKey: "i_files_count")
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
        if sFileNumber != nil{
            aCoder.encode(sFileNumber, forKey: "s_file_number")
        }
        if sDescription != nil{
            aCoder.encode(sDescription, forKey: "s_description")
        }
        if sExtension != nil{
            aCoder.encode(sExtension, forKey: "s_extension")
        }
        if sFile != nil{
            aCoder.encode(sFile, forKey: "s_file")
        }
        if sFileLogo != nil{
            aCoder.encode(sFileLogo, forKey: "s_file_logo")
        }
        if fkITypeId != nil{
            aCoder.encode(fkITypeId, forKey: "fk_i_type_id")
        }
        if sTypeName != nil{
            aCoder.encode(sTypeName, forKey: "s_type_name")
        }
        if fkIUserId != nil{
            aCoder.encode(fkIUserId, forKey: "fk_i_user_id")
        }
        if sNotes != nil{
            aCoder.encode(sNotes, forKey: "s_notes")
        }
        if bSecret != nil{
            aCoder.encode(bSecret, forKey: "b_secret")
        }
        if fkIExtensionId != nil{
            aCoder.encode(fkIExtensionId, forKey: "fk_i_extension_id")
        }
        if sExtensionName != nil{
            aCoder.encode(sExtensionName, forKey: "s_extension_name")
        }
        if fkICategoryId != nil{
            aCoder.encode(fkICategoryId, forKey: "fk_i_category_id")
        }
        if sCategoryName != nil{
            aCoder.encode(sCategoryName, forKey: "s_category_name")
        }
        if fkIProjectId != nil{
            aCoder.encode(fkIProjectId, forKey: "fk_i_project_id")
        }
        if sProjectName != nil{
            aCoder.encode(sProjectName, forKey: "s_project_name")
        }
        if bDeletedSeen != nil{
            aCoder.encode(bDeletedSeen, forKey: "b_deleted_seen")
        }
        if sAttachments != nil{
            aCoder.encode(sAttachments, forKey: "s_attachments")
        }
        if dtFileDate != nil{
            aCoder.encode(dtFileDate, forKey: "dt_file_date")
        }
        if sType != nil{
            aCoder.encode(sType, forKey: "s_type")
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
