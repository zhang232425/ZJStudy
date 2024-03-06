//
//  Bundle+Extension.swift
//  ZJStudy
//
//  Created by Jercan on 2024/3/6.
//

import Foundation

extension Bundle {
    
    static var framework_ZJStudy: Bundle {
        let frameworkName = "ZJStudy"
        let resourcePath: NSString = .init(string: Bundle(for: ZJStudyClass.self).resourcePath ?? "")
        let path = resourcePath.appendingPathComponent("/\(frameworkName).bundle")
        return Bundle(path: path)!
    }
    
    private class ZJStudyClass {}
    
}
