//
//  ViewController.swift
//  TravelTeamProject
//
//  Created by Daisy on 2021/01/08.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
  
  
  private lazy var titleLabel: UILabel = {
    let titleLabel = UILabel()
    titleLabel.textColor = .white
    titleLabel.text = "여행기"
    titleLabel.textAlignment = .center
    titleLabel.NGothic(fontSize: 85)
    view.addSubview(titleLabel)
    return titleLabel
  }()
  
  
  public lazy var subTitleLabel: UILabel = {
    let titleLabel = UILabel()
    titleLabel.textColor = .white
    titleLabel.text = "열심히 일 한 당신 떠나요!"
    titleLabel.textAlignment = .center
    titleLabel.NGothic(fontSize: 16)
    view.addSubview(titleLabel)
    return titleLabel
  }()
  
  
  private lazy var loginButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitle("로그인", for: .normal)
    button.titleLabel?.font = UIFont.NanumGothic(size: 20)
    button.addTarget(self, action: #selector(actionLoginBtn(_:)), for: .touchUpInside)
    button.setTitleColor(UIColor.appColor(.primaryGreen),
                         for: .normal)
    button.backgroundColor = .white
    view.addSubview(button)
    return button
  }()
  
  
  private lazy var sighUpButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitle("회원가입", for: .normal)
    button.titleLabel?.font = UIFont.NanumGothic(size: 20)
    button.addTarget(self, action: #selector(actionSignUpBtn(_:)), for: .touchUpInside)
    button.setTitleColor(UIColor.appColor(.primaryGreen),
                         for: .normal)
    button.backgroundColor = .white
    view.addSubview(button)
    return button
  }()
  
  
  private lazy var exclamatioMarkImgView: UIImageView = {
    let imgView = UIImageView()
    imgView.contentMode = .scaleAspectFit
    imgView.image = UIImage(named: "exclamatioMark")
    view.addSubview(imgView)
    return imgView
  }()
  
  
  private lazy var infoLabel: UILabel = {
    let infoLabel = UILabel()
    infoLabel.textColor = .white
    infoLabel.text = "본 서비스는 여행기의 내용을 회원끼리 \n 공유하는 서비스 입니다."
    infoLabel.numberOfLines = 0
    infoLabel.textAlignment = .center
    infoLabel.NSquareR(fontSize: 16)
    view.addSubview(infoLabel)
    return infoLabel
  }()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.appColor(.primaryGreen)
    configureAutolayout()
    congigureCornerRadius()
  }
  
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    configureNavi()
    self.navigationController?.navigationBar.isHidden = true
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    self.navigationController?.navigationBar.isHidden = false
  }

  // MARK: - Setting Navi
  private func configureNavi() {
    self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    self.navigationController?.navigationBar.shadowImage = UIImage()
    self.navigationController?.navigationBar.isTranslucent = true
  }
  
  // MARK: - ActionMethod
  @objc func actionLoginBtn(_ sender: UIButton) {
    print("actionLoginBtn")
    let loginVC = LoginViewController()
    self.navigationController?.pushViewController(loginVC, animated: true)
  }
  
  @objc func actionSignUpBtn(_ sender: UIButton) {
    print("signUpButton")
  }
  
  
  
  
  // MARK: - CornerRadius 설정
  private func congigureCornerRadius() {
    loginButton.layer.cornerRadius = 14
    loginButton.clipsToBounds = true
    
    sighUpButton.layer.cornerRadius = 14
    sighUpButton.clipsToBounds = true
  }
  
  
  
  // MARK: - Configure Layout
  private func configureAutolayout() {
    
    titleLabel.snp.makeConstraints { make in
      make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(100)
      make.centerX.equalToSuperview()
    }
    
    subTitleLabel.snp.makeConstraints { make in
      make.top.equalTo(titleLabel.snp.bottom).offset(5)
      make.centerX.equalToSuperview()
    }
    
    loginButton.snp.makeConstraints { make in
      make.top.equalTo(view.snp.centerY)
      make.leading.trailing.equalToSuperview().inset(20)
      make.height.equalTo(CustomBtnSize.heightR)
    }
    
    sighUpButton.snp.makeConstraints { make in
      make.top.equalTo(loginButton.snp.bottom).offset(15)
      make.leading.trailing.equalTo(loginButton)
      make.height.equalTo(CustomBtnSize.heightR)
    }
    
    exclamatioMarkImgView.snp.makeConstraints { make in
      make.top.equalTo(infoLabel)
      make.leading.equalTo(sighUpButton.snp.leading)
      make.width.height.equalTo(20)
    }
    
    infoLabel.snp.makeConstraints { make in
      make.top.equalTo(sighUpButton.snp.bottom).offset(25)
      make.leading.trailing.equalTo(loginButton)
    }
  }
}

