//
//  MainVC.swift
//  TravelTeamProject
//
//  Created by Daisy on 2021/01/13.
//

import UIKit
import SnapKit


struct TestData {
  var dateTime = Int()
}

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
  private var isOpen = false
  private var height: Constraint?
  
  private var tableViewData = [TableData(title: "순천만", img: "travelPic0", dateTime: "6/15 - AM 10:00"),
                               TableData(title: "여수", img: "travelPic1", dateTime: "7/12 - AM 11:00"),
                               TableData(title: "제주", img: "travelPic2", dateTime: "8/2 - AM 10:00"),
                               TableData(title: "광주", img: "travelPic3", dateTime: "11/9 - PM 6:00"),
                               TableData(title: "거제도", img: "travelPic5", dateTime: "12/25 - PM 2:00")
  ]
  
  private var sortedArr: [TableData] = []
  
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
  
  private lazy var dropView: DropDownView = {
    let dropView = DropDownView()
    dropView.delegate = self
    dropView.dropDownOptions = ["최신순", "과거순"]
    self.view.addSubview(dropView)
    return dropView
  }()
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    sortedArr = tableViewData // FIXME: - api 통신이 아니라 임시
    configureAutoLayout()
    configureNavi()
    
    //    let maxY = view.safeAreaInsets.bottom
    //    print("maxY", maxY)
    //    let height = UIScreen.main.bounds.height
    //    print("height", height)
  }
  
  
  // MARK: - Setting Navi
  private func configureNavi() {
    self.navigationController?.navigationBar.shadowImage = UIImage()
    self.navigationController?.navigationBar.isTranslucent = false
    self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.appColor(.gray70), NSAttributedString.Key.font: UIFont.NanumSquareBold(size: 26) ]
    self.navigationItem.title = "나의 여행지"
    
    
    // right
    let filterBtn = UIButton()
    let filterImg = UIImage(named: "icons-filter")?.withRenderingMode(.alwaysTemplate)
    filterBtn.setImage(filterImg, for: .normal)
    filterBtn.isHighlighted = false
    filterBtn.tintColor = UIColor.appColor(.gray70)
    filterBtn.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
    filterBtn.addTarget(self, action: #selector(actionRsbtn), for: .touchUpInside)
    let filter = UIBarButtonItem(customView: filterBtn)
    navigationItem.rightBarButtonItem = filter
  }
  
  
  @objc func actionRsbtn() {
    
    if isOpen == false {
      isOpen = true
      
      self.dropView.snp.updateConstraints { make in
        self.height = make.height.equalTo(self.dropView.tableview.contentSize.height).constraint
      }
      
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
    dropView.snp.updateConstraints { make in
      make.height.equalTo(0)
    }
    
    UIView.animate(withDuration: 0.2) {
      self.dropView.center.y -= self.dropView.frame.height / 2
      self.dropView.layoutIfNeeded()
    }
  }
  
  
  public func homeTest() {
    print("🍎")
  }
  
  
  // MARK: - AutoLayout
  private func configureAutoLayout() {
    tableView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
    
    dropView.snp.remakeConstraints { make in
      make.top.trailing.equalToSuperview().inset(10)
      make.width.equalTo(150)
      self.height = make.height.equalTo(0).constraint
    }
  }
}



extension HomeVC: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return sortedArr.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeue(TourTableCell.self)
    cell.delegate = self
    cell.selectionStyle = .none
    cell.setCell(data: self.sortedArr[indexPath.row], myTour: myTour, index: indexPath.row)
    return cell
  }
  
  func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
    dismissDropDown()
  }
}



extension HomeVC: TourTableCellDelegate {
  func jumpToDetailTour() {
    let tabbar = tabBarController as? MyTabBarController
    tabbar?.selectedIndex = 1
    tabbar?.setupButton(index: 1)
  }
}



extension HomeVC: DropDownProrocol {
  func dropDownPressed(index: Int) {
    dismissDropDown()
    
    print("index📌",index)
    if index == 0 { //최신순
      self.sortedArr = tableViewData.sorted { (lhs, rhs) -> Bool in
        return lhs.dateTime > rhs.dateTime
      }
    } else if index == 1 { //과거순
      self.sortedArr = tableViewData.sorted { (lhs, rhs) -> Bool in
        return lhs.dateTime < rhs.dateTime
      }
    } else {
      print("지정된 정렬이 아닙니다")
    }
    
    tableView.reloadData()
  }
}
