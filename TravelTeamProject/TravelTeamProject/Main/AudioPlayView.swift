//
//  AudioPlayView.swift
//  TravelTeamProject
//
//  Created by Daisy on 2021/01/29.
//

import UIKit


protocol AudioPlayDelegate {
  func close()
  func list()
  func rewind()
  func pause()
  func forward()
}

class AudioPlayView: UIView {

  var delegate: AudioPlayDelegate?
  
  private lazy var closeBtn: UIButton = {
    let button = UIButton(type: .custom)
    button.addTarget(self, action: #selector(actionCloseAudioPlayBtn(_:)), for: .touchUpInside)
    button.setTitleColor(UIColor.appColor(.primaryGreen),
                         for: .normal)
    let image = UIImage(systemName: "xmark")
    button.setImage(image, for: .normal)
    button.tintColor = .white
    addSubview(button)
    return button
  }()
  

  private lazy var jumpToList: UIButton = {
    let button = UIButton(type: .custom)
    button.addTarget(self, action: #selector(actionJumpToListBtn(_:)), for: .touchUpInside)
    let image = UIImage(systemName: "square.stack.3d.up")
    button.setImage(image, for: .normal)
    button.tintColor = .white
    addSubview(button)
    return button
  }()
  
  
  private lazy var placeNameLabel: UILabel = {
    let infoLabel = UILabel()
    infoLabel.textColor = .white
    infoLabel.text = "고씨동굴고씨동굴고씨동굴고씨동굴고씨동굴"  // 임시값
    infoLabel.textAlignment = .center
    infoLabel.NSquareB(fontSize: 16)
    addSubview(infoLabel)
    return infoLabel
  }()
  
  
  private lazy var rewindBtn: UIButton = {
    let button = UIButton(type: .custom)
    button.addTarget(self, action: #selector(actionRewindBtn(_:)), for: .touchUpInside)
    let image = UIImage(systemName: "backward")
    button.setImage(image, for: .normal)
    button.tintColor = .white
    addSubview(button)
    return button
  }()
  
  
  private lazy var pauseBtn: UIButton = {
    let button = UIButton(type: .custom)
    button.addTarget(self, action: #selector(actionPauseBtn(_:)), for: .touchUpInside)
    let image = UIImage(systemName: "pause")
    button.setImage(image, for: .normal)
    button.tintColor = .white
    addSubview(button)
    return button
  }()

  
  private lazy var fastForwardBtn: UIButton = {
    let button = UIButton(type: .custom)
    button.addTarget(self, action: #selector(actionFastForwardBtn(_:)), for: .touchUpInside)
    let image = UIImage(systemName: "forward")
    button.setImage(image, for: .normal)
    button.tintColor = .white
    addSubview(button)
    return button
  }()
  
  
  private lazy var currentTimeLabel: UILabel = {
    let label = UILabel()
    label.NSquareR(fontSize: 8)
    label.textAlignment = .center
    label.text = "00:00"
    label.textColor = .white
    addSubview(label)
    return label
  }()


  private lazy var videoLengthLabel: UILabel = {
    let label = UILabel()
    label.NSquareR(fontSize: 8)
    label.textAlignment = .center
    label.text = "00:00"
    label.textColor = .white
    addSubview(label)
    return label
  }()

  
  
  
  // MARK: - App life cycle
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = UIColor.appColor(.primaryGreen)
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    fatalError("init(coder:) has not been implemented")
  }
  
  
  override func layoutSubviews() {
    super.layoutSubviews()
    configureAutoLayout()
  }
  
  // MARK: - ActionMethod
  @objc func actionCloseAudioPlayBtn(_ sender: UIButton) {
    delegate?.close()
  }
  
  @objc func actionJumpToListBtn(_ sender: UIButton) {
    delegate?.list()
  }
  
  
  @objc func actionRewindBtn(_ sender: UIButton) {
    delegate?.rewind()
  }
  
  @objc func actionPauseBtn(_ sender: UIButton) {
    delegate?.pause()
  }
  
  @objc func actionFastForwardBtn(_ sender: UIButton) {
    delegate?.forward()
  }
  
  // MARK: - AutoLayout
  private func configureAutoLayout() {
    let padding = UIScreen.main.bounds.width/20
    
    closeBtn.snp.makeConstraints { make in
      make.top.leading.equalToSuperview().inset(padding)
    }
    
    jumpToList.snp.makeConstraints { make in
      make.centerY.equalTo(closeBtn)
      make.leading.equalTo(closeBtn.snp.trailing).offset(padding/2)
    }

    placeNameLabel.snp.makeConstraints { make in
      make.centerY.equalTo(closeBtn)
      make.leading.equalTo(jumpToList.snp.trailing).offset(padding/2)
      make.trailing.lessThanOrEqualTo(currentTimeLabel.snp.leading).offset(-padding/2)
    }

    currentTimeLabel.snp.makeConstraints { make in
      make.centerY.equalTo(closeBtn)
      make.width.greaterThanOrEqualTo(25)
      make.trailing.equalTo(rewindBtn.snp.leading).offset(-padding*0.7)
    }

    rewindBtn.snp.makeConstraints { make in
      make.centerY.equalTo(closeBtn)
      make.width.equalTo(padding)
      make.trailing.equalTo(pauseBtn.snp.leading).offset(-padding*0.9)
    }
    
    pauseBtn.snp.makeConstraints { make in
      make.centerY.equalTo(closeBtn)
      make.width.equalTo(rewindBtn)
      make.trailing.equalTo(fastForwardBtn.snp.leading).offset(-padding*0.9)
    }

    fastForwardBtn.snp.makeConstraints { make in
      make.centerY.equalTo(closeBtn)
      make.width.equalTo(rewindBtn)
      make.trailing.equalTo(videoLengthLabel.snp.leading).offset(-padding*0.7)
    }
    
    videoLengthLabel.snp.makeConstraints { make in
      make.centerY.equalTo(closeBtn)
      make.width.greaterThanOrEqualTo(25)
      make.trailing.equalToSuperview().inset(padding*1.1)
    }
  }
}
