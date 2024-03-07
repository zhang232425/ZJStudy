//
//  ZJStudyModule.swift
//  ZJStudy
//
//  Created by Jercan on 2024/3/5.
//

import ZJRouter
import ZJRoutableTargets

public struct ZJStudyModule: ZJModule {
    
    public init() {}
    
    public func initialize() {
        
        ZJStudyRoutableTarget.register(path: ZJStudyRoutePath.grammar) { _ in
            return ZJBaseNavigationVC(rootViewController: ZJGrammarVC())
        }
        
        ZJStudyRoutableTarget.register(path: ZJStudyRoutePath.scheme) { _ in
            return ZJBaseNavigationVC(rootViewController: ZJSchemeVC())
        }
        
        ZJStudyRoutableTarget.register(path: ZJStudyRoutePath.algorithm) { _ in
            return ZJBaseNavigationVC(rootViewController: ZJAlgorithmVC())
        }
        
    }
    
}
