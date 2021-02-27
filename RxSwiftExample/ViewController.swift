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
    
    
    
    //MARK:- Properties
    let viewModel = ViewModel()
    
    var disposeBag = DisposeBag()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bindUI()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        disposeBag = DisposeBag()
    }
    
    func bindUI(){
        // Input
        textFieldId.rx.text.orEmpty
            .bind(to: viewModel.subjectId)
            .disposed(by: disposeBag)
        
        textFieldPassword.rx.text.orEmpty
            .bind(to: viewModel.subjectPassword)
            .disposed(by: disposeBag)
        
        //Output
        
        viewModel.subjectIdValid
            .bind(to: imgViewIdValidation.rx.isHidden)
            .disposed(by: disposeBag)
        
        viewModel.subjectPasswordValid
            .bind(to: imgViewPWValidation.rx.isHidden)
            .disposed(by: disposeBag)
        
        Observable.combineLatest(viewModel.subjectIdValid, viewModel.subjectPasswordValid, resultSelector:
                                    {(s1 , s2) in s1 && s2})
            .bind(to: buttonLogin.rx.isEnabled)
            .disposed(by: disposeBag)
    }


}

