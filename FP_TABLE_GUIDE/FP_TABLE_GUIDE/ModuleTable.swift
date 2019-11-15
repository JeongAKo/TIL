//
//  ModuleTable.swift
//  FP_TABLE_GUIDE
//
//  Created by 고정아 on 2019/11/07.
//  Copyright © 2019 고정아. All rights reserved.
//

import UIKit

protocol ModuleTableProtocol {
  func selIndex(index:Int)
}

class ModuleTable:NSObject, UITableViewDelegate, UITableViewDataSource {
  
  private var table_type = 0
    private let protocol_ : ModuleTableProtocol? = nil
  
 
  
   
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch(self.table_type) {
    case 1 :
      return 10
      
      
    case 2 :
      return 1
      
      
    default :
      return 1
      
      
    }
     
   }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    self.protocol_?.selIndex(index: 0)
  }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "FirstTableViewCell") as! FirstTableViewCell
     cell.backgroundColor = .green
     return cell
   }
}
