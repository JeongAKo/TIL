//
//  TableCollExtentions.swift
//  TravelTeamProject
//
//  Created by Daisy on 2021/01/16.
//

import Foundation


import UIKit

protocol Identifiable {
  static var identifier: String { get }
}
extension Identifiable {
  static var identifier: String {
    return String(describing: self)
  }
}


extension UITableViewCell: Identifiable { }

extension UITableView {
  // regiser 가 제네릭 타입 이라 Identifiable 프로토콜 을 채택하지 않은 Cell 이 들어올 수 있는 가능성 때문에
  // where 로 지정해주지 않으면 컴파일 에러 난다.
  
  func register<Cell>(
    cell: Cell.Type,
    forCellReuseIdentifier reuseIdentifier: String = Cell.identifier
  ) where Cell: UITableViewCell {
    register(cell, forCellReuseIdentifier: reuseIdentifier)
  }
  
  func dequeue<Cell>(_ reusableCell: Cell.Type) -> Cell where Cell: UITableViewCell {
    guard let cell = dequeueReusableCell(
      withIdentifier: reusableCell.identifier
    ) as? Cell else { fatalError("Could not find cell with identifier") }
    return cell
  }
  
  // tableView.register(cell: CurrentForecastCell.self)
  // let cell = tableView.dequeue(CurrentForecastCell.self)
}


extension UICollectionViewCell: Identifiable { }

extension UICollectionView {
  func register<Cell> (
    cell: Cell.Type,
    forCellReuseIdentifier reuseIdentifier: String = Cell.identifier
  ) where Cell: UICollectionViewCell {
    register(cell, forCellWithReuseIdentifier: reuseIdentifier)
  }
  
  func dequeue<Cell>(
    _ reusableCell: Cell.Type,
    _ indexpath: IndexPath) -> Cell where Cell: UICollectionViewCell {
    guard let cell = dequeueReusableCell(withReuseIdentifier: reusableCell.identifier, for: indexpath) as? Cell else { fatalError("Could not find cell with identifier") }
    return cell
  }
}
