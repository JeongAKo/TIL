 //
//  LoginViewController.swift
//  TravelTeamProject
//
//  Created by Daisy on 2021/01/09.
//

import UIKit

enum UserRegistForm: String {
  case logIn = "로그인"
  case findPW = "비밀번호 찾기"
  case signUp = "회원가입"
}

class UserRegistVC: UIViewController {
  
  private var userRegistForm: UserRegistForm?
  
  private lazy var idTextfield: UITextField = {
    let textField = UITextField()
    textField.attributedPlaceholder = NSAttributedString.settingWhitePlaceholder(text: "UserID")
    textField.autocorrectionType = .no
    textField.autocapitalizationType = .none
    textField.textColor = UIColor.white
    textField.font = UIFont.NanumSquareRegular(size: 20)
    textField.addTarget(self, action: #selector(inputTextfield(_:)), for: .editingChanged)
    textField.keyboardType = .default
    textField.returnKeyType = .done
    view.addSubview(textField)
    return textField
  }()
  
  private lazy var idSeperateLine: UIView = {
    let line = UIView()
    line.backgroundColor = UIColor.white
    view.addSubview(line)
    return line
  }()
  
  
  private lazy var idInfoLabel: UILabel = {
    let infoLabel = UILabel()
    infoLabel.textColor = UIColor.appColor(.red)
    infoLabel.textAlignment = .left
    infoLabel.NSquareR(fontSize: 10)
    view.addSubview(infoLabel)
    return infoLabel
  }()
  
  
  private lazy var pwTextfield: UITextField = {
    let textField = UITextField()
    textField.attributedPlaceholder = NSAttributedString.settingWhitePlaceholder(text: "Password")
    textField.autocorrectionType = .no
    textField.autocapitalizationType = .none
    textField.textColor = UIColor.white
    textField.font = UIFont.NanumSquareRegular(size: 20)
    textField.addTarget(self, action: #selector(inputTextfield(_:)), for: .editingChanged)
    textField.keyboardType = .default
    textField.returnKeyType = .done
    view.addSubview(textField)
    return textField
  }()
  
  private lazy var pwSeperateLine: UIView = {
    let line = UIView()
    line.backgroundColor = UIColor.white
    view.addSubview(line)
    return line
  }()
  
  private lazy var pwInfoLabel: UILabel = {
    let infoLabel = UILabel()
    infoLabel.textColor = UIColor.appColor(.red)
    infoLabel.textAlignment = .left
    infoLabel.NSquareR(fontSize: 10)
    view.addSubview(infoLabel)
    return infoLabel
  }()
  
  
  private lazy var pwConfirmTextfield: UITextField = {
    let textField = UITextField()
    textField.attributedPlaceholder = NSAttributedString.settingWhitePlaceholder(text: "PasswordConfirm")
    textField.autocorrectionType = .no
    textField.autocapitalizationType = .none
    textField.textColor = UIColor.white
    textField.font = UIFont.NanumSquareRegular(size: 20)
    textField.addTarget(self, action: #selector(inputTextfield(_:)), for: .editingChanged)
    textField.keyboardType = .default
    textField.returnKeyType = .done
    view.addSubview(textField)
    return textField
  }()
  
  private lazy var pwConfirmSeperateLine: UIView = {
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
    button.titleLabel?.font = UIFont.NanumSquareRegular(size: 15)
    button.addTarget(self, action: #selector(actionConfirmBtn(_:)), for: .touchUpInside)
    button.setTitleColor(UIColor.appColor(.primaryGreen),
                         for: .normal)
    button.setTitle("확인", for: .normal)
    button.backgroundColor = .white
    view.addSubview(button)
    return button
  }()
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.appColor(.primaryGreen)
    configureNavi()
    congigureBaseLayout()
    congigureCornerRadius()
  }
  
  
  override func viewDidDisappear(_ animated: Bool) {
    initialInstances()
  }
  
  
  
  // MARK: - Setting Navi
  private func configureNavi() {
    self.navigationController?.navigationBar.tintColor = .white
    
    let newBtn = UIBarButtonItem(image: UIImage(named: "icon-back"), style: .plain, target: self, action: #selector(actionBackBtn))
    
    self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white, NSAttributedString.Key.font: UIFont.NanumSquareBold(size: 26) ]
    self.navigationItem.leftBarButtonItem = newBtn
  }
  
  
  // MARK: - Action Method
  @objc func actionBackBtn(_ sender: UIBarButtonItem) {
    self.navigationController?.popViewController(animated: true)
  }
  
  
  @objc func actionFindPWBtn(_ sender: UIButton) {
    let findPWVC = UserRegistVC()
    findPWVC.setUserRegistFormVC(form: .findPW)
    self.navigationController?.pushViewController(findPWVC, animated: true)
  }
  
  @objc func actionConfirmBtn(_ sender: UIButton) {
    if idTextfield.text == "" {
      idSeperateLine.backgroundColor  = .red
      idTextfield.attributedPlaceholder = NSAttributedString.settingRedPlaceholder(text: "UserID")
      
      idInfoLabel.isHidden = false
      
      if self.userRegistForm?.rawValue == UserRegistForm.logIn.rawValue {
        idInfoLabel.text = "올바른 아이디를 입력하세요"
        pwInfoLabel.text = "올바른 비밀번호를 입력하세요"
      } else if self.userRegistForm?.rawValue == UserRegistForm.findPW.rawValue {
        idInfoLabel.text = "아이디를 입력하세요"
      }
    }
    
    if pwTextfield.text == "" {
      pwSeperateLine.backgroundColor  = .red
      pwTextfield.attributedPlaceholder = NSAttributedString.settingRedPlaceholder(text: "Password")
    }
    
    if pwConfirmTextfield.text == "" {
      pwConfirmSeperateLine.backgroundColor  = .red
      pwConfirmTextfield.attributedPlaceholder = NSAttributedString.settingRedPlaceholder(text: "PasswordConfirm")
    }
    
    switch userRegistForm?.rawValue  {
    case UserRegistForm.logIn.rawValue:
      if idTextfield.text != "" && pwTextfield.text != ""  {
        let homeVC = HomeVC()
        self.navigationController?.pushViewController(homeVC, animated: false)
      }
      
    case UserRegistForm.findPW.rawValue:
      if idTextfield.text != "" {
        let homeVC = HomeVC()
        self.navigationController?.pushViewController(homeVC, animated: false)
      }
      
    case UserRegistForm.signUp.rawValue:
      if idTextfield.text != "" && pwTextfield.text != "" && pwConfirmTextfield.text != "" {
        let homeVC = HomeVC()
        self.navigationController?.pushViewController(homeVC, animated: false)
      }
      
    default:
      print("지정된 UserRegistForm이 아닙니다")
    }
  }
  
  
  @objc func inputTextfield(_ sender: UITextField) {
    guard let text = sender.text else {return}
    if text != "" {
      initialInstances()
    }
  }
  
  private func initialInstances() {
    idInfoLabel.isHidden = true
    
    idSeperateLine.backgroundColor  = .white
    idTextfield.attributedPlaceholder = NSAttributedString.settingWhitePlaceholder(text: "UserID")
    
    pwSeperateLine.backgroundColor  = .white
    pwTextfield.attributedPlaceholder = NSAttributedString.settingWhitePlaceholder(text: "Password")
    
    pwConfirmSeperateLine.backgroundColor  = .white
    pwConfirmTextfield.attributedPlaceholder = NSAttributedString.settingWhitePlaceholder(text: "PasswordConfirm")
  }
  
  
  public func setUserRegistFormVC(form: UserRegistForm) {
    self.userRegistForm = form
    self.title = form.rawValue
    
    switch form {
    case .logIn:
      print("로그인")
      
    case .signUp:
      print("회원가입")
      congigureSignUpLayout()
      
    case .findPW:
      print("비밀번호 찾기")
      congigurePWLayout()
      
    default:
      print("지정된 Form이 아닙니다")
    }
  }
  
  
  // MARK: - CornerRadius 설정
  private func congigureCornerRadius() {
    confirmButton.layer.cornerRadius = CustomBtnSize.radiusR
    confirmButton.clipsToBounds = true
  }
  
  
  // MARK: - Configure Layout
  // 로그인
  private let padding: CGFloat = 20
  private func congigureBaseLayout() {
    
    idTextfield.snp.makeConstraints { make in
      make.top.equalTo(view.snp.bottom).multipliedBy(0.3)
      make.leading.trailing.equalToSuperview().inset(padding)
    }
    
    idSeperateLine.snp.makeConstraints { make in
      make.top.equalTo(idTextfield.snp.bottom).offset(padding)
      make.leading.trailing.equalTo(idTextfield)
      make.height.equalTo(1)
    }
    
    idInfoLabel.snp.makeConstraints { make in
      make.top.equalTo(idSeperateLine.snp.bottom).offset(padding/2)
      make.leading.trailing.equalTo(idSeperateLine)
    }
    
    pwTextfield.snp.makeConstraints { make in
      make.top.equalTo(idSeperateLine.snp.bottom).offset(padding*2)
      make.leading.trailing.equalTo(idTextfield)
    }
    
    pwSeperateLine.snp.makeConstraints { make in
      make.top.equalTo(pwTextfield.snp.bottom).offset(padding)
      make.leading.trailing.equalTo(idTextfield)
      make.height.equalTo(1)
    }
    
    pwInfoLabel.snp.makeConstraints { make in
      make.top.equalTo(pwSeperateLine.snp.bottom).offset(padding/2)
      make.leading.trailing.equalTo(pwSeperateLine)
    }
    
    findPWButton.snp.makeConstraints { make in
      make.top.equalTo(pwSeperateLine.snp.bottom).offset(padding)
      make.trailing.equalToSuperview().inset(padding)
    }
    
    confirmButton.snp.makeConstraints { make in
      make.top.equalTo(findPWButton.snp.bottom).offset(padding*4)
      make.leading.trailing.equalToSuperview().inset(padding)
      make.height.equalTo(CustomBtnSize.heightR)
    }
  }
  
  // 비밀번호 찾기
  private func congigurePWLayout() {
    self.pwTextfield.isHidden = true
    self.pwSeperateLine.isHidden = true
    self.findPWButton.isHidden = true
    self.idInfoLabel.isHidden = true
    self.pwInfoLabel.isHidden = true
    self.confirmButton.setTitle("비밀번호 찾기", for: .normal)
  }
  
  // 회원가입
  private func congigureSignUpLayout() {
    self.findPWButton.isHidden = true
    pwConfirmTextfield.snp.makeConstraints { make in
      make.top.equalTo(pwSeperateLine).offset(padding*2)
      make.leading.trailing.equalTo(idTextfield)
    }
    
    pwConfirmSeperateLine.snp.makeConstraints { make in
      make.top.equalTo(pwConfirmTextfield.snp.bottom).offset(padding)
      make.leading.trailing.equalTo(idTextfield)
      make.height.equalTo(1)
    }
  }
}

