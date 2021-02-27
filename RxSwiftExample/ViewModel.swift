//
//  ViewModel.swift
//  RxSwiftExample
//
//  Created by Randy on 2021/02/27.
//

import RxSwift
import Foundation

class ViewModel {
    //MARK:- BehaviorSubject
    
    let subjectId = BehaviorSubject<String>(value: "")
    let subjectPassword = BehaviorSubject<String>(value: "")
    
    let subjectIdValid = BehaviorSubject<Bool>(value: false)
    let subjectPasswordValid = BehaviorSubject<Bool>(value: false)
    
    var disposeBag = DisposeBag()
    
    init() {
        _ = subjectId
            .distinctUntilChanged()
            .map(isValidId)
            .bind(to: subjectIdValid)
        
        _ = subjectPassword
            .distinctUntilChanged()
            .map(isValidPassword(_:))
            .bind(to: subjectPasswordValid)
    }
    
    func isValidId(_ id : String) -> Bool{
        return id.contains("@") && id.contains(".")
    }
    
    func isValidPassword(_ pw : String) -> Bool{
        return pw.count > 5
    }
}

