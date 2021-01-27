//
//  MapVC.swift
//  TravelTeamProject
//
//  Created by Daisy on 2021/01/13.
//

import UIKit

class MapVC: UIViewController {
  var button = DropDownBtn()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .orange
    
    button = DropDownBtn.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    button.setTitle("Colors", for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    self.view.addSubview(button)
    
    button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    button.widthAnchor.constraint(equalToConstant: 100).isActive = true
    button.heightAnchor.constraint(equalToConstant: 40).isActive = true
    
    button.dropView.dropDownOptions = ["Blue", "Green", "Magenta", "White", "Black", "Pink"]
  }
  
  func mapTest() {
    print("🥦")
  }
}
