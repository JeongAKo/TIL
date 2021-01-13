//
//  LoginData.swift
//  TravelTeamProject
//
//  Created by Daisy on 2021/01/13.
//

import Foundation

class Config {
  public static let shared = Config()
  var loginData = LoginData()
  private init() {
  }
}


class LoginData {
  var isLogin: Bool = true
  var userId: String = ""
  var nicName: String = ""
}

