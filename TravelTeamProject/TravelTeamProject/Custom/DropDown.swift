//
//  DropDown.swift
//  TravelTeamProject
//
//  Created by Daisy on 2021/01/27.
//

import UIKit

protocol DropDownProrocol {
  func dropDownPressed(index: Int)
}

protocol DropDownDismissProrocol {
  func dismiss()
}

class DropDownBtn: UIButton, DropDownDismissProrocol {
  func dismiss() {
    print("💩", index)
    self.dismissDropDown()
  }
  
  var dropView = DropDownView()
  var height = NSLayoutConstraint()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    dropView = DropDownView.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
    dropView.translatesAutoresizingMaskIntoConstraints = false
    dropView.dismissDel = self
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func didMoveToSuperview() {
    self.superview?.addSubview(dropView)
    self.superview?.bringSubviewToFront(dropView)
    
    dropView.topAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    dropView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    dropView.widthAnchor.constraint(equalTo: self.widthAnchor, constant: 100).isActive = true
    height = dropView.heightAnchor.constraint(equalToConstant: 0)
  }
  
  var isOpen = false
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    if isOpen == false {
      isOpen = true
      
      NSLayoutConstraint.deactivate([self.height])
      
      if self.dropView.tableview.contentSize.height > 150 {
        self.height.constant = 150
      } else {
        self.height.constant = self.dropView.tableview.contentSize.height
      }
      
      
      NSLayoutConstraint.activate([self.height])
      
      UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
        self.dropView.layoutIfNeeded()
        self.dropView.center.y += self.dropView.frame.height / 2
      }, completion: nil)
      
    } else {
      dismissDropDown()
    }
  }
  
  func dismissDropDown() {
    isOpen = false
    NSLayoutConstraint.deactivate([self.height])
    self.height.constant = 0
    NSLayoutConstraint.activate([self.height])
    
    UIView.animate(withDuration: 0.2) {
      self.dropView.center.y -= self.dropView.frame.height / 2
      self.dropView.layoutIfNeeded()
    }
  }
}



class DropDownView: UIView, UITableViewDataSource, UITableViewDelegate {
  var delegate: DropDownProrocol?
  var dismissDel: DropDownDismissProrocol?
    
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
    tableview.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(tableview)
    
    tableview.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
    tableview.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    tableview.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    tableview.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    
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
    cell.selectionStyle = UITableViewCell.SelectionStyle.none
    cell.textLabel?.font = UIFont.NanumSquareRegular(size: 17)
    cell.textLabel?.textColor = UIColor.appColor(.gray70)
    cell.textLabel?.text = dropDownOptions[indexPath.row]
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("🎒")
    delegate?.dropDownPressed(index: indexPath.row)
    dismissDel?.dismiss()
  }
}
