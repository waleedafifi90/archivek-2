//
//  Files.swift
//  archivek
//
//  Created by Waleed Afifi on 04/02/2020.
//  Copyright © 2020 Waleed Afifi. All rights reserved.
//

import Foundation


class Files : NSObject, NSCoding{

    var bDeletedSeen : Bool?
    var bEnabled : Bool?
    var bSecret : Bool?
    var dtCreatedDate : String?
    var dtDeletedDate : AnyObject?
    var dtFileDate : AnyObject?
    var dtModifiedDate : String?
    var fkICategoryId : Int?
    var fkIExtensionId : Int?
    var fkIParentId : Int?
    var fkIProjectId : Int?
    var fkITypeId : Int?
    var fkIUserId : Int?
    var pkIId : Int?
    var sAttachments : [String]?
    var sCategoryName : String?
    var sDescription : String?
    var sExtension : AnyObject?
    var sExtensionName : String?
    var sExtra1 : AnyObject?
    var sExtra2 : AnyObject?
    var sExtra3 : AnyObject?
    var sExtra4 : AnyObject?
    var sFile : String?
    var sFileLogo : String?
    var sFileNumber : String?
    var sFilesCount : Int?
    var sImage : String?
    var sName : String?
    var sNotes : String?
    var sProjectName : String?
    var sType : String?
    var sTypeName : String?


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init?(fromDictionary dictionary: [String:Any]){
        bDeletedSeen = dictionary["b_deleted_seen"] as? Bool
        bEnabled = dictionary["b_enabled"] as? Bool
        bSecret = dictionary["b_secret"] as? Bool
        dtCreatedDate = dictionary["dt_created_date"] as? String
        dtDeletedDate = dictionary["dt_deleted_date"] as? AnyObject
        dtFileDate = dictionary["dt_file_date"] as? AnyObject
        dtModifiedDate = dictionary["dt_modified_date"] as? String
        fkICategoryId = dictionary["fk_i_category_id"] as? Int
        fkIExtensionId = dictionary["fk_i_extension_id"] as? Int
        fkIParentId = dictionary["fk_i_parent_id"] as? Int
        fkIProjectId = dictionary["fk_i_project_id"] as? Int
        fkITypeId = dictionary["fk_i_type_id"] as? Int
        fkIUserId = dictionary["fk_i_user_id"] as? Int
        pkIId = dictionary["pk_i_id"] as? Int
        sCategoryName = dictionary["s_category_name"] as? String
        sDescription = dictionary["s_description"] as? String
        sExtension = dictionary["s_extension"] as? AnyObject
        sExtensionName = dictionary["s_extension_name"] as? String
        sExtra1 = dictionary["s_extra_1"] as? AnyObject
        sExtra2 = dictionary["s_extra_2"] as? AnyObject
        sExtra3 = dictionary["s_extra_3"] as? AnyObject
        sExtra4 = dictionary["s_extra_4"] as? AnyObject
        sFile = dictionary["s_file"] as? String
        sFileLogo = dictionary["s_file_logo"] as? String
        sFileNumber = dictionary["s_file_number"] as? String
        sFilesCount = dictionary["s_files_count"] as? Int
        sImage = dictionary["s_image"] as? String
        sName = dictionary["s_name"] as? String
        sNotes = dictionary["s_notes"] as? String
        sProjectName = dictionary["s_project_name"] as? String
        sType = dictionary["s_type"] as? String
        sTypeName = dictionary["s_type_name"] as? String
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if bDeletedSeen != nil{
            dictionary["b_deleted_seen"] = bDeletedSeen
        }
        if bEnabled != nil{
            dictionary["b_enabled"] = bEnabled
        }
        if bSecret != nil{
            dictionary["b_secret"] = bSecret
        }
        if dtCreatedDate != nil{
            dictionary["dt_created_date"] = dtCreatedDate
        }
        if dtDeletedDate != nil{
            dictionary["dt_deleted_date"] = dtDeletedDate
        }
        if dtFileDate != nil{
            dictionary["dt_file_date"] = dtFileDate
        }
        if dtModifiedDate != nil{
            dictionary["dt_modified_date"] = dtModifiedDate
        }
        if fkICategoryId != nil{
            dictionary["fk_i_category_id"] = fkICategoryId
        }
        if fkIExtensionId != nil{
            dictionary["fk_i_extension_id"] = fkIExtensionId
        }
        if fkIParentId != nil{
            dictionary["fk_i_parent_id"] = fkIParentId
        }
        if fkIProjectId != nil{
            dictionary["fk_i_project_id"] = fkIProjectId
        }
        if fkITypeId != nil{
            dictionary["fk_i_type_id"] = fkITypeId
        }
        if fkIUserId != nil{
            dictionary["fk_i_user_id"] = fkIUserId
        }
        if pkIId != nil{
            dictionary["pk_i_id"] = pkIId
        }
        if sCategoryName != nil{
            dictionary["s_category_name"] = sCategoryName
        }
        if sDescription != nil{
            dictionary["s_description"] = sDescription
        }
        if sExtension != nil{
            dictionary["s_extension"] = sExtension
        }
        if sExtensionName != nil{
            dictionary["s_extension_name"] = sExtensionName
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
        if sFile != nil{
            dictionary["s_file"] = sFile
        }
        if sFileLogo != nil{
            dictionary["s_file_logo"] = sFileLogo
        }
        if sFileNumber != nil{
            dictionary["s_file_number"] = sFileNumber
        }
        if sFilesCount != nil{
            dictionary["s_files_count"] = sFilesCount
        }
        if sImage != nil{
            dictionary["s_image"] = sImage
        }
        if sName != nil{
            dictionary["s_name"] = sName
        }
        if sNotes != nil{
            dictionary["s_notes"] = sNotes
        }
        if sProjectName != nil{
            dictionary["s_project_name"] = sProjectName
        }
        if sType != nil{
            dictionary["s_type"] = sType
        }
        if sTypeName != nil{
            dictionary["s_type_name"] = sTypeName
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        bDeletedSeen = aDecoder.decodeObject(forKey: "b_deleted_seen") as? Bool
        bEnabled = aDecoder.decodeObject(forKey: "b_enabled") as? Bool
        bSecret = aDecoder.decodeObject(forKey: "b_secret") as? Bool
        dtCreatedDate = aDecoder.decodeObject(forKey: "dt_created_date") as? String
        dtDeletedDate = aDecoder.decodeObject(forKey: "dt_deleted_date") as? AnyObject
        dtFileDate = aDecoder.decodeObject(forKey: "dt_file_date") as? AnyObject
        dtModifiedDate = aDecoder.decodeObject(forKey: "dt_modified_date") as? String
        fkICategoryId = aDecoder.decodeObject(forKey: "fk_i_category_id") as? Int
        fkIExtensionId = aDecoder.decodeObject(forKey: "fk_i_extension_id") as? Int
        fkIParentId = aDecoder.decodeObject(forKey: "fk_i_parent_id") as? Int
        fkIProjectId = aDecoder.decodeObject(forKey: "fk_i_project_id") as? Int
        fkITypeId = aDecoder.decodeObject(forKey: "fk_i_type_id") as? Int
        fkIUserId = aDecoder.decodeObject(forKey: "fk_i_user_id") as? Int
        pkIId = aDecoder.decodeObject(forKey: "pk_i_id") as? Int
        sAttachments = aDecoder.decodeObject(forKey: "s_attachments") as? [String]
        sCategoryName = aDecoder.decodeObject(forKey: "s_category_name") as? String
        sDescription = aDecoder.decodeObject(forKey: "s_description") as? String
        sExtension = aDecoder.decodeObject(forKey: "s_extension") as? AnyObject
        sExtensionName = aDecoder.decodeObject(forKey: "s_extension_name") as? String
        sExtra1 = aDecoder.decodeObject(forKey: "s_extra_1") as? AnyObject
        sExtra2 = aDecoder.decodeObject(forKey: "s_extra_2") as? AnyObject
        sExtra3 = aDecoder.decodeObject(forKey: "s_extra_3") as? AnyObject
        sExtra4 = aDecoder.decodeObject(forKey: "s_extra_4") as? AnyObject
        sFile = aDecoder.decodeObject(forKey: "s_file") as? String
        sFileLogo = aDecoder.decodeObject(forKey: "s_file_logo") as? String
        sFileNumber = aDecoder.decodeObject(forKey: "s_file_number") as? String
        sFilesCount = aDecoder.decodeObject(forKey: "s_files_count") as? Int
        sImage = aDecoder.decodeObject(forKey: "s_image") as? String
        sName = aDecoder.decodeObject(forKey: "s_name") as? String
        sNotes = aDecoder.decodeObject(forKey: "s_notes") as? String
        sProjectName = aDecoder.decodeObject(forKey: "s_project_name") as? String
        sType = aDecoder.decodeObject(forKey: "s_type") as? String
        sTypeName = aDecoder.decodeObject(forKey: "s_type_name") as? String
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if bDeletedSeen != nil{
            aCoder.encode(bDeletedSeen, forKey: "b_deleted_seen")
        }
        if bEnabled != nil{
            aCoder.encode(bEnabled, forKey: "b_enabled")
        }
        if bSecret != nil{
            aCoder.encode(bSecret, forKey: "b_secret")
        }
        if dtCreatedDate != nil{
            aCoder.encode(dtCreatedDate, forKey: "dt_created_date")
        }
        if dtDeletedDate != nil{
            aCoder.encode(dtDeletedDate, forKey: "dt_deleted_date")
        }
        if dtFileDate != nil{
            aCoder.encode(dtFileDate, forKey: "dt_file_date")
        }
        if dtModifiedDate != nil{
            aCoder.encode(dtModifiedDate, forKey: "dt_modified_date")
        }
        if fkICategoryId != nil{
            aCoder.encode(fkICategoryId, forKey: "fk_i_category_id")
        }
        if fkIExtensionId != nil{
            aCoder.encode(fkIExtensionId, forKey: "fk_i_extension_id")
        }
        if fkIParentId != nil{
            aCoder.encode(fkIParentId, forKey: "fk_i_parent_id")
        }
        if fkIProjectId != nil{
            aCoder.encode(fkIProjectId, forKey: "fk_i_project_id")
        }
        if fkITypeId != nil{
            aCoder.encode(fkITypeId, forKey: "fk_i_type_id")
        }
        if fkIUserId != nil{
            aCoder.encode(fkIUserId, forKey: "fk_i_user_id")
        }
        if pkIId != nil{
            aCoder.encode(pkIId, forKey: "pk_i_id")
        }
        if sAttachments != nil{
            aCoder.encode(sAttachments, forKey: "s_attachments")
        }
        if sCategoryName != nil{
            aCoder.encode(sCategoryName, forKey: "s_category_name")
        }
        if sDescription != nil{
            aCoder.encode(sDescription, forKey: "s_description")
        }
        if sExtension != nil{
            aCoder.encode(sExtension, forKey: "s_extension")
        }
        if sExtensionName != nil{
            aCoder.encode(sExtensionName, forKey: "s_extension_name")
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
        if sFile != nil{
            aCoder.encode(sFile, forKey: "s_file")
        }
        if sFileLogo != nil{
            aCoder.encode(sFileLogo, forKey: "s_file_logo")
        }
        if sFileNumber != nil{
            aCoder.encode(sFileNumber, forKey: "s_file_number")
        }
        if sFilesCount != nil{
            aCoder.encode(sFilesCount, forKey: "s_files_count")
        }
        if sImage != nil{
            aCoder.encode(sImage, forKey: "s_image")
        }
        if sName != nil{
            aCoder.encode(sName, forKey: "s_name")
        }
        if sNotes != nil{
            aCoder.encode(sNotes, forKey: "s_notes")
        }
        if sProjectName != nil{
            aCoder.encode(sProjectName, forKey: "s_project_name")
        }
        if sType != nil{
            aCoder.encode(sType, forKey: "s_type")
        }
        if sTypeName != nil{
            aCoder.encode(sTypeName, forKey: "s_type_name")
        }
    }
}
