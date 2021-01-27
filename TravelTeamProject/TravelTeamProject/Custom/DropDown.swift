//
//  DropDown.swift
//  TravelTeamProject
//
//  Created by Daisy on 2021/01/27.
//

import UIKit

protocol DropDownProrocol {
  func dropDownPewssed(index: Int)
}


class DropDownBtn: UIButton {
  
  var dropView = DropDownView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    dropView = DropDownView.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    dropView.translatesAutoresizingMaskIntoConstraints = false
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func didMoveToSuperview() {
    self.superview?.addSubview(dropView)
    self.superview?.bringSubviewToFront(dropView)
    
    dropView.snp.makeConstraints { make in
      make.top.equalTo(self.snp.bottom)
      make.trailing.equalToSuperview()
      make.width.equalTo(150)
      make.height.equalTo(0)
    }
  }
  
  var isOpen = false
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    if isOpen == false {
      isOpen = true
      
      if self.dropView.tableview.contentSize.height > 150 {
        dropView.snp.updateConstraints { make in
          make.height.equalTo(150)
        }
      } else {
        dropView.snp.updateConstraints { make in
          make.height.equalTo(self.dropView.tableview.contentSize.height)
        }
      }
      
      UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.9, options: .curveEaseInOut, animations: {
        //        self.dropView.center.y += self.dropView.frame.height / 2
        self.dropView.layoutIfNeeded()
      }, completion: nil)
      
    } else {
      isOpen = false
      dropView.snp.updateConstraints { make in
        make.height.equalTo(0)
      }
      UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
        //        self.dropView.center.y -= self.dropView.frame.height / 2
        self.dropView.layoutIfNeeded()
      }, completion: nil)
    }
  }
}



class DropDownView: UIView, UITableViewDataSource, UITableViewDelegate {
  var delegate: DropDownProrocol?
  
  var dropDownOptions = [String]()
  var tableview = UITableView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    tableview.delegate = self
    tableview.dataSource = self
    tableview.backgroundColor = .white
    tableview.layer.borderWidth = 1
    tableview.layer.borderColor = UIColor.lightGray.cgColor
    tableview.separatorStyle = .none
    self.addSubview(tableview)
    
    tableview.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dropDownOptions.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    cell.textLabel?.font = UIFont.NanumSquareRegular(size: 17)
    cell.textLabel?.textColor = UIColor.appColor(.gray70)
    cell.textLabel?.text = dropDownOptions[indexPath.row]
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("📌", indexPath.row)
    delegate?.dropDownPewssed(index: indexPath.row)
  }
}
