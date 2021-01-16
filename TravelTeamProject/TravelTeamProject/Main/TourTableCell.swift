//
//  TourTableCell.swift
//  TravelTeamProject
//
//  Created by Daisy on 2021/01/16.
//

import UIKit

class TourTableCell: UITableViewCell {
  private var myTour: MyTour?
  
  private lazy var placeTitleLable: UILabel = {
    let infoLabel = UILabel()
    infoLabel.textColor = UIColor.appColor(.gray454)
    infoLabel.textAlignment = .left
    infoLabel.NSquareB(fontSize: 24)
    contentView.addSubview(infoLabel)
    return infoLabel
  }()
  
  private lazy var timeLable: UILabel = {
    let infoLabel = UILabel()
    infoLabel.textColor = UIColor.appColor(.gray454)
    infoLabel.textAlignment = .left
    infoLabel.NSquareR(fontSize: 14)
    contentView.addSubview(infoLabel)
    return infoLabel
  }()
  
  
  private lazy var leftAccImg: UIImageView = {
    let imageview = UIImageView()
    imageview.contentMode = .scaleAspectFit
    let image = UIImage(named: "left")?.withRenderingMode(.alwaysTemplate)
    imageview.tintColor = UIColor.appColor(.gray784)
    imageview.image = image
    contentView.addSubview(imageview)
    return imageview
  }()
  
  private lazy var picThumbnailImgButton: UIButton = {
    let button = UIButton(type: .custom)
    button.addTarget(self, action: #selector(actionThumbnailBtn(_:)), for: .touchUpInside)
    button.contentMode = .scaleAspectFit
    button.backgroundColor = .lightGray
    button.adjustsImageWhenHighlighted = false
    contentView.addSubview(button)
    return button
  }()
  
  // MARK: - App Life Cycle
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    self.backgroundColor = .white
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    picThumbnailImgButton.clipsToBounds = true
    picThumbnailImgButton.layer.cornerRadius = 12
  }
  
  
  // MARK: - ActionMethod
  public func setCell(data: TableData, myTour: MyTour) {
    self.myTour = myTour
    
    if myTour.rawValue == MyTour.main.rawValue {
      configureAutolayout()
    } else if myTour.rawValue == MyTour.detail.rawValue {
      configureDetailLayout()
    } else {
      print("지정된 MyTour enumType이 아닙니다")
    }
    
    placeTitleLable.text = data.title
    timeLable.text = data.dateTime
    picThumbnailImgButton.setImage(UIImage(named: data.img), for: .normal)
  }
  
  @objc func actionThumbnailBtn(_ sender: UIButton) {
    if self.myTour?.rawValue == MyTour.main.rawValue {
      print("상세투어로 가기🤸🏻‍♀️")
    } else if self.myTour?.rawValue == MyTour.detail.rawValue {
      print("추억의 오디오 재생📽")
    } else {
      print("지정된 MyTour enumType이 아닙니다")
    }
  }
  
  
  // MARK: - AutoLayout
  private func configureAutolayout() {
    let padding: CGFloat = 10.0
    
    placeTitleLable.snp.makeConstraints { make in
      make.top.equalToSuperview()
      make.leading.equalToSuperview().inset(padding)
    }
    
    timeLable.snp.makeConstraints { make in
      make.centerY.equalTo(placeTitleLable)
      make.leading.equalTo(placeTitleLable.snp.trailing).offset(padding/2)
      make.trailing.lessThanOrEqualToSuperview().inset(padding)
    }
    
    picThumbnailImgButton.snp.makeConstraints { make in
      make.top.equalTo(placeTitleLable.snp.bottom).offset(padding/2)
      make.leading.trailing.equalToSuperview().inset(padding)
      make.bottom.equalToSuperview().inset(padding*2)
      make.height.equalTo(160)
    }
  }
  
  
  
  private func configureDetailLayout() {
    let padding: CGFloat = 20.0
    
    placeTitleLable.snp.makeConstraints { make in
      make.top.equalToSuperview()
      make.leading.equalToSuperview().inset(padding)
    }
    
    timeLable.snp.makeConstraints { make in
      make.centerY.equalTo(placeTitleLable)
      make.leading.equalTo(placeTitleLable.snp.trailing).offset(padding/2)
      make.trailing.lessThanOrEqualToSuperview().inset(padding)
    }
    
    leftAccImg.snp.makeConstraints { make in
      make.top.bottom.equalTo(picThumbnailImgButton).inset(padding)
      make.leading.equalToSuperview().inset(padding)
      make.width.equalTo(20)
    }
    
    picThumbnailImgButton.snp.makeConstraints { make in
      make.top.equalTo(placeTitleLable.snp.bottom).offset(padding/2)
      make.leading.equalTo(leftAccImg.snp.trailing).offset(padding/2)
      make.trailing.bottom.equalToSuperview().inset(padding)
      make.height.equalTo(100)
    }
  }
}
