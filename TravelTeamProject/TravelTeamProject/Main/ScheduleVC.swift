//
//  ScheduleVC.swift
//  TravelTeamProject
//
//  Created by Daisy on 2021/01/13.
//

import UIKit

class ScheduleVC: UIViewController {
  private var myTour = MyTour.detail
  
  private var tableViewData = [TableData(title: "영월역", img: "travelPic6", dateTime: "6/15 - AM 10:00"),
                               TableData(title: "고씨동굴", img: "travelPic7", dateTime: "6/15 - AM 11:00"),
                               TableData(title: "김삿갓 유적지", img: "travelPic4", dateTime: "6/15 - PM 1:00"),
                               TableData(title: "법흥사", img: "travelPic9", dateTime: "6/15 - PM 4:00"),
                               TableData(title: "젊은달 테마파크", img: "travelPic10", dateTime: "6/15 - PM :00")
  ]
  
  private lazy var tableView: UITableView = {
    let tableView = UITableView(frame: .zero)
    tableView.dataSource = self
    tableView.delegate = self
    tableView.register(cell: TourTableCell.self)
    tableView.backgroundColor = .white
    tableView.separatorStyle = .none
    tableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    view.addSubview(tableView)
    return tableView
  }()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    configureNavi()
    configureAutoLayout()
  }
  
  
  // MARK: - Setting Navi
  private func configureNavi() {
    self.navigationController?.navigationBar.shadowImage = UIImage()
    self.navigationController?.navigationBar.isTranslucent = false
    self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.appColor(.gray70), NSAttributedString.Key.font: UIFont.NanumSquareBold(size: 26) ]
    self.navigationItem.title = "상세 투어내역"
  }
  
  
  public func scheduleTest() {
    print("🍋")
  }
  
  
  
  // MARK: - AutoLayout
  private func configureAutoLayout() {
    tableView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }
}





extension ScheduleVC: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tableViewData.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeue(TourTableCell.self)
    cell.selectionStyle = .none
    cell.playAudioDelegate = self
    cell.setCell(data: self.tableViewData[indexPath.row], myTour: myTour, index: indexPath.row)
    return cell
  }
}


extension ScheduleVC: PlayAudioDelegate {
  func clickAction(index: Int) {
    print("🚩🚩🚩🚩🚩", index)
  }
}
