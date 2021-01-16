//
//  MainVC.swift
//  TravelTeamProject
//
//  Created by Daisy on 2021/01/13.
//

import UIKit


struct TableData {
  var title = String()
  var img = String()
  var dateTime = String()
}

enum MyTour: String {
  case main
  case detail
}


class HomeVC: UIViewController {
  private var myTour = MyTour.main
  
  private var tableViewData = [TableData(title: "순천만", img: "travelPic0", dateTime: "6/15 - AM 10:00"),
                               TableData(title: "여수", img: "travelPic1", dateTime: "7/12 - AM 11:00"),
                               TableData(title: "제주", img: "travelPic2", dateTime: "8/2 - AM 10:00"),
                               TableData(title: "광주", img: "travelPic3", dateTime: "11/9 - PM 6:00"),
                               TableData(title: "남이섬", img: "travelPic4", dateTime: "12/25 - PM 2:00")
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
    self.navigationItem.title = "나의 여행지"
    
    
    // right
    var filterBtn: UIButton = UIButton(type: .custom)
    let filterImg = UIImage(named: "icons-filter")?.withRenderingMode(.alwaysTemplate)
    filterBtn.setImage(filterImg, for: .normal)
    filterBtn.isHighlighted = false
    filterBtn.tintColor = UIColor.appColor(.gray70)
    filterBtn.addTarget(self, action: #selector(actionFilterBtn), for: .touchUpInside)
    filterBtn.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
    let filter = UIBarButtonItem(customView: filterBtn)
    navigationItem.rightBarButtonItem = filter
  }
  
  public func homeTest() {
    print("🍎")
  }
  
  @objc func actionFilterBtn(_ sender: UIButton) {
    print("🧩")
  }
  
  
  
  
  // MARK: - AutoLayout
  private func configureAutoLayout() {
    tableView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }
}


extension HomeVC: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tableViewData.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeue(TourTableCell.self)
    cell.selectionStyle = .none
    cell.setCell(data: self.tableViewData[indexPath.row], myTour: myTour)
    return cell
  }
}
