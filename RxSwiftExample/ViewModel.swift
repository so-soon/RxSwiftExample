//
//  ViewModel.swift
//  RxSwiftExample
//
//  Created by Randy on 2021/02/27.
//

import RxSwift
import Foundation

class ViewModel {
    
    init() {
        
    }
    
    func isValidId(_ id : String) -> Bool{
        return id.contains("@") && id.contains(".")
    }
    
    func isValidPassword(_ pw : String) -> Bool{
        return pw.count > 5
    }
}

