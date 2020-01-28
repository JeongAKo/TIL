# header

~~~swift
let tableView = UITableView(frame: .zero, style: .grouped)
~~~



~~~swift
tableView.register(cell: ProfileUserCell.self)

//let cell = tableView.dequeue(ProfileUserCell.self) 
    let cell = tableView.dequeueReusableCell(withIdentifier: ProfileUserCell.identifier, for: indexPath) as! ProfileUserCell //익스텐션 써서 VC이름으로 Identifier지정
~~~

~~~swift
tableView.allowsSelection = false // 셀 클릭시 눌리지 않게
tableView.isScrollEnabled = false // 스크롤 되지 않게
tableView.alwaysBounceVertical = false // 스크롤 되지 않게
tableView.separatorColor = .clear // seperator 없애기
cell.selectionStyle = UITableViewCell.SelectionStyle.none // 셀 클릭 시 색깔 <여기서 .None 으로 안하고 색상 넣으면 색상 변경 할 수 있다.>
tableView.separatorStyle = .none
~~~



##### Cell 앞쪽에 separatorLine 공간 뜨는거 해결

~~~swift

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

cell.separatorInset = UIEdgeInsets.zero

}
~~~



#### 빈 셀에는 separatorLine 안보이게 하기

~~~swift
  override func viewDidLoad() {
    super.viewDidLoad()

    tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))

  }
~~~



#### Indicator bar 숨기기

~~~swift
tableView.showsVerticalScrollIndicator = false //collectionView도 가능
tableView.showsHorizonotalScrollIndicator = false
~~~



※ 참조

https://www.ioscreator.com/tutorials/customizing-table-view-ios-tutorial 





#### 각각의 셀높이 조정 UITableViewDelegate 사용

~~~swift

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    switch indexPath.row {
    case 0:
      return 220
    case 1:
      return 120
    default:
      return 90
    }
  }

~~~



#### 유동적인 셀높이 조정

~~~swift
   tableView.estimatedRowHeight = 680
   tableView.rowHeight = UITableView.automaticDimension
~~~

https://www.youtube.com/watch?v=JvjEqWHcyIw 참고



~~~swift
// xib 활용 CustomCell 만들기
// 커스텀셀 VC 만들때  + Also creat XIB file 체크하기

class CustomCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()

    }

}

CustomVC 에 xib 에서 만든거 아울렛 연결

Xib identifier 이름지정 ex) Cell



//tableView 만드는 곳에 

tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "Cell")


~~~



~~~swift
      let refreshControl = UIRefreshControl()
    refreshControl.addTarget(self, action: #selector(reloadData), for: .valueChanged)
    refreshControl.tintColor = .lightGray
    refreshControl.attributedTitle = NSAttributedString(string: "Refreshing...")
    tableView.refreshControl = refreshControl

  }
    
  
  @objc func reloadData() {
    tableView.refreshControl?.endRefreshing()  //계속계속 뺑뺑이 안돌아가게
    tableView.reloadData()
  }
~~~



### Header 높이

~~~swift
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 설정값
  }	
~~~





#### 상단에 공간 뜨는것

~~~swift
    if #available(iOS 13.0, *) {
      tableView.automaticallyAdjustsScrollIndicatorInsets = false
    } else {
      tableView.contentInset = UIEdgeInsetsMake(-36, 0, 0, 0)
    }

tableView.contentInsetAdjustmentBehavior = .never // 상단에 gap 없앨시  → 이건 뭐더라;;;
~~~





~~~swift
tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
~~~



~~~swift
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CheckListTableCell") as! CheckListTableCell
tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
// or
cell.accessoryType = .detailButton
  }
  
  func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CheckListTableCell") as! CheckListTableCell
tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
  }
~~~

