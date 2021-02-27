//
//  ViewController.swift
//  RxSwiftExample
//
//  Created by Randy on 2021/02/27.
//

import RxSwift
import RxCocoa
import UIKit

class ViewController: UIViewController {

    //MARK:- IBOutlet
    @IBOutlet weak var textFieldId: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var buttonLogin: UIButton!
    
    @IBOutlet weak var imgViewIdValidation: UIImageView!
    @IBOutlet weak var imgViewPWValidation: UIImageView!
    
    //MARK:- BehaviorSubject
    
    //MARK:- Properties
    let viewModel = ViewModel()
    
    var disposeBag = DisposeBag()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bindUI()
    }
    
    func bindUI(){
        textFieldId.rx.text.orEmpty
            .map(self.viewModel.isValidId)
            .subscribe(onNext: {
                        isValid in
                        self.imgViewIdValidation.isHidden = !isValid
            })
            .disposed(by: disposeBag)
        
        textFieldPassword.rx.text.orEmpty
            .map(self.viewModel.isValidPassword)
            .subscribe(onNext: {
                isValid in
                self.imgViewPWValidation.isHidden = !isValid
            })
            .disposed(by: disposeBag)
    }


}

