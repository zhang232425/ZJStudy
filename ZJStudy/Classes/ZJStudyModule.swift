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
            return ZJGrammarVC()
        }
        
        ZJStudyRoutableTarget.register(path: ZJStudyRoutePath.function) { _ in
            return ZJFunctionVC()
        }
        
        ZJStudyRoutableTarget.register(path: ZJStudyRoutePath.scheme) { _ in
            return ZJSchemeVC()
        }
        
        ZJStudyRoutableTarget.register(path: ZJStudyRoutePath.algorithm) { _ in
            return ZJAlgorithmVC()
        }
        
    }
    
}
