//
//  LoginViewController.swift
//  TravelTeamProject
//
//  Created by Daisy on 2021/01/09.
//

import UIKit

//enum Intro


class LoginViewController: UIViewController {
  
  private lazy var IDTextfield: UITextField = {
    let textField = UITextField()
    textField.placeholder = "UserID"
    textField.autocorrectionType = .no
    textField.autocapitalizationType = .none
    textField.textColor = UIColor.white
      textField.font = UIFont.NanumSquareRegular(size: 20)
    textField.keyboardType = .default
    textField.returnKeyType = .next
//    textField.addTarget(self, action: #selector(inputTextfield(_:)), for: .editingChanged)
//    textField.delegate = self
    view.addSubview(textField)
    return textField
  }()
  
  private lazy var IDSeperateLine: UIView = {
    let line = UIView()
    line.backgroundColor = UIColor.white
    view.addSubview(line)
    return line
  }()
  
  private lazy var PWTextfield: UITextField = {
    let textField = UITextField()
    textField.placeholder = "Password"
    textField.autocorrectionType = .no
    textField.autocapitalizationType = .none
    textField.textColor = UIColor.white
      textField.font = UIFont.NanumSquareRegular(size: 20)
    textField.keyboardType = .default
    textField.returnKeyType = .next
//    textField.addTarget(self, action: #selector(inputTextfield(_:)), for: .editingChanged)
//    textField.delegate = self
    view.addSubview(textField)
    return textField
  }()
  
  private lazy var PWSeperateLine: UIView = {
    let line = UIView()
    line.backgroundColor = UIColor.white
    view.addSubview(line)
    return line
  }()
  
  
  
  private lazy var findPWButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitle("비밀번호 찾기", for: .normal)
    button.titleLabel?.font = UIFont.NanumSquareRegular(size: 15)
    button.addTarget(self, action: #selector(actionFindPWBtn(_:)), for: .touchUpInside)
    button.setTitleColor(UIColor.white,
                         for: .normal)
    view.addSubview(button)
    return button
  }()
  
  
  private lazy var confirmButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitle("확인", for: .normal)
    button.titleLabel?.font = UIFont.NanumSquareRegular(size: 15)
    button.addTarget(self, action: #selector(actionConfirmBtn(_:)), for: .touchUpInside)
    button.setTitleColor(UIColor.appColor(.primaryGreen),
                         for: .normal)
    button.backgroundColor = .white
    view.addSubview(button)
    return button
  }()
  
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.appColor(.primaryGreen)
    configureNavi()
    configureAutolayout()
    congigureCornerRadius()
  }
  
  
  // MARK: - Setting Navi
  private func configureNavi() {
    self.navigationController?.navigationBar.tintColor = .white
    
    
    let newBtn = UIBarButtonItem(image: UIImage(named: "icon-back"), style: .plain, target: self, action: #selector(actionBackBtn))
    
    self.title = "로그인"
    
    self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white, NSAttributedString.Key.font: UIFont.NanumSquareBold(size: 26) ]
    self.navigationItem.leftBarButtonItem = newBtn
  }
  
  
  // MARK: - Action Method
  @objc func actionBackBtn(_ sender: UIBarButtonItem) {
    print("Back")
    self.navigationController?.popViewController(animated: true)
  }
  

  @objc func actionFindPWBtn(_ sender: UIButton) {
    print("actionFindPWBtn")
  }
  
  @objc func actionConfirmBtn(_ sender: UIButton) {
    print("actionConfirmBtn")
  }

  
  // MARK: - CornerRadius 설정
  private func congigureCornerRadius() {
    confirmButton.layer.cornerRadius = CustomBtnSize.radiusR
    confirmButton.clipsToBounds = true
  }
  
  // MARK: - Configure Layout
  private func configureAutolayout() {
    let padding: CGFloat = 20
    
    IDTextfield.snp.makeConstraints { make in
      make.top.equalTo(view.snp.bottom).multipliedBy(0.3)
      make.leading.trailing.equalToSuperview().inset(padding)
    }
    
    IDSeperateLine.snp.makeConstraints { make in
      make.top.equalTo(IDTextfield.snp.bottom).offset(padding)
      make.leading.trailing.equalTo(IDTextfield)
      make.height.equalTo(1)
    }
    
    PWTextfield.snp.makeConstraints { make in
      make.top.equalTo(IDSeperateLine.snp.bottom).offset(padding*2)
      make.leading.trailing.equalTo(IDTextfield)
    }
    
    PWSeperateLine.snp.makeConstraints { make in
      make.top.equalTo(PWTextfield.snp.bottom).offset(padding)
      make.leading.trailing.equalTo(IDTextfield)
      make.height.equalTo(1)
    }
    
    findPWButton.snp.makeConstraints { make in
      make.top.equalTo(PWSeperateLine.snp.bottom).offset(padding)
      make.trailing.equalToSuperview().inset(padding)
    }
    
    confirmButton.snp.makeConstraints { make in
      make.top.equalTo(findPWButton.snp.bottom).offset(padding*4)
      make.leading.trailing.equalToSuperview().inset(padding)
      make.height.equalTo(CustomBtnSize.heightR)
    }
  }
}
