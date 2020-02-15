//
//  BaseFile.swift
//  archivek
//
//  Created by Waleed Afifi on 30/01/2020.
//  Copyright © 2020 Waleed Afifi. All rights reserved.
//

import Foundation

enum FileDataType: String {
    case image = "image/png"
    case video = "video/mp4"
    case audio = "audio/mp3"
    case pdf = ".pdf"
    case docx = ".docx"
    case xlsx = ".xlsx"
    case pptx = ".pptx"
    case png = ".png"
    case gif = ".gif"
    case webp = ".webp"
    case svg = ".svg"
    case ai = ".ai"
    case eps = ".eps"
}

class BaseFile {
    var data: Data?
    var name: String?
    var type: FileDataType = .image
    
    var fileName: String {
        switch type {
        case .image:
            return "\(self.name ?? "image").png"
        case .video:
            return "\(self.name ?? "video").mp4"
        case .audio:
            return "\(self.name ?? "audio").mp3"
        case .pdf:
            return "\(self.name ?? "pdfDocuments").pdf"
        case .docx:
            return "\(self.name ?? "wordFile").docx"
        case .xlsx:
            return "\(self.name ?? "xlsxFile").xlsx"
        case .pptx:
            return "\(self.name ?? "pptFile").pptx"
        case .png:
            return "\(self.name ?? "pngFile").png"
        case .gif:
            return "\(self.name ?? "gifFile").gif"
        case .webp:
            return "\(self.name ?? "webpFile").webp"
        case .svg:
            return "\(self.name ?? "svgFile").svg"
        case .ai:
            return "\(self.name ?? "aiFile").ai"
        case .eps:
            return "\(self.name ?? "epsFile").eps"
        }
    }
}
