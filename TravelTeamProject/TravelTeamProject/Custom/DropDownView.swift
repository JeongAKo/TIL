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


class DropDownView: UIView, UITableViewDataSource, UITableViewDelegate {
  var delegate: DropDownProrocol?
    
  var dropDownOptions = [String]()
  var tableview = UITableView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    tableview.delegate = self
    tableview.dataSource = self
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
    delegate?.dropDownPressed(index: indexPath.row)
  }
}
