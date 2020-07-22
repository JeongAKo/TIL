# header

##### parallax Header swift → 공부하기

##### Stretchy Header 

##### SwiftUI: Create a Stretchable Header with Parallax 

https://medium.com/swlh/swiftui-create-a-stretchable-header-with-parallax-scrolling-4a98faeeb262

https://blckbirds.com/post/stretchy-header-and-parallax-scrolling-in-swiftui/



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
tableView.allowsMultipleSelection = true // 멀티터치 가능
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



### footer 공간뜨는 거 해결

~~~swift
tableView.contentInsetAdjustmentBehavior = .never


extension Viewcontroller: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    return nil
  }
  
  func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    return CGFloat.leastNonzeroMagnitude
  }
 }
~~~



### Footer 설정 세팅

~~~swift
 func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    guard let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: "OrderAgreeTableFooterView") as? OrderAgreeTableFooterView else {return nil}
    return footer
  }
  
  //우선 정의해두고 푸터 결정되면 삭제해도됨
  func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    return 100
  }

func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
    view.tintColor = UIColor.green //컬러 지정
  }
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





#### tableview.deleterows

~~~swift
  var tableArry = ["딸기","망고","수박","청포도","배","체리","바나나"]

func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
        tableArry.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
      //
    }
  }
~~~





#### Pagination 

공부하기

https://ehdrjsdlzzzz.github.io/2018/09/19/Smoothen-your-table-view-data-loading-using-UITableViewDataSource-Prefetching/



~~~swift
// MARK: - Properties
  var recordArray: [Int] = []
  var limit = 10
  let totalEntries = 100
  var shareCount = 0 // 페이지 넘긴 수
  lazy var share = totalEntries/limit //몫
  lazy var rest = totalEntries%limit //나머지

// MARK: - App life cycle

// 초기값 설정
 override func viewDidLoad() {
    super.viewDidLoad()
    var index = 0
    if share == 0 { //limit값보다 최대값이 작을때 ex) limit: 10, totalEntries: 3
      while index < rest {  //나머지 값 개수를 세팅
        recordArray.append(index)
        index = index + 1
      }
    } else {
      while index < limit {
        recordArray.append(index) // limit값 만큼 초기 세팅
        index = index + 1
        print("여기로 들어오니?")
      }
    }
 }

// MARK: - Extionsion
extension ViewController: UITableViewDataSource, UITableViewDelegate {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return recordArray.count
  }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableCell") as! MyTableCell
    cell.textLabel.text = "row\([indexPath.row])"
    return cell
  }
  
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    if indexPath.row == recordArray.count - 1 { //cell linit값의 -1 에서 append 해주기
      if recordArray.count < totalEntries { // 토탈 개수보다 작으면 append하는데
        var index = recordArray.count
        if shareCount == (share - 1) { //만약 12개 에서 이미 10개를 로드 해줬으면 2개만 로드 
          limit = index + rest // rest 값만큼 append
          while index<limit {
            recordArray.append(index)
            index = index + 1
          }
        } else {               //아니라면 limit 개수만큼 append
          limit = index + 10
          while index<limit {
            recordArray.append(index)
            index = index + 1
          }
        }
        self.perform(#selector(loadTable), with: nil, afterDelay: 1.0)
        shareCount = shareCount + 1   // 몇 번 로드했는지 세주기 위해 (몫을 채우면 나머지값만 Array에 append해주려고 카운팅)
      }
    }
  }
  
  
~~~



#### 특정 행으로 이동 

~~~swift
 let indexPath = IndexPath(row: 0, section: 0)
  tableView.scrollToRow(at: indexPath, at: .top, animated: true)
~~~



#### contentOffset 설정하여 최상단 이동

~~~swift
tableView.contentOffset = CGPoint(x: 0, y: 0 - tableView.contentInset.top), animated: true)
//or
tableView.setContentOffset(CGPoint.zero, animated: true)
~~~





##### UITableView에서 리로드할 때 스크롤 포지션 어긋나는 이슈

https://gwangyonglee.tistory.com/42





### UIScrollView의 컨텐츠에 UITableView를 사용하기

UIScrollView에 UITableView를 서브뷰로 추가하고, UITableView의 컨텐츠 사이즈만큼 UIScrollView를 스크롤링하는게 목표이다. 이때 UITableView는 스크롤링되지 않는다



~~~swift

override func viewDidLoad() {
        super.viewDidLoad()
        

        DispatchQueue.main.async {
            self.tableViewHeight.constant = self.tableView.contentSize.height
        }
    }

~~~



http://devmgk.blogspot.com/2018/12/uiscrollview-uitableview-uitableview.html







## 이미지 높이 맞춰주기

~~~swift
  var imageArr = ["seojun", "seojun1", "seojun2", "seojun3"]

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    let currentImage = UIImage(named: imageArr[indexPath.row])
    guard let imageCrop = currentImage?.getCropRatio() else { return 0 }
    return tableView.frame.width / imageCrop
  }

extension UIImage {
  func getCropRatio() -> CGFloat {
    var widthRatio = CGFloat(self.size.width / self.size.height)
    return widthRatio
  }
}





//
class ScaledHeightImageView: UIImageView {

    override var intrinsicContentSize: CGSize {

        if let myImage = self.image {
            let myImageWidth = myImage.size.width
            let myImageHeight = myImage.size.height
            let myViewWidth = self.frame.size.width

            let ratio = myViewWidth/myImageWidth
            let scaledHeight = myImageHeight * ratio

            return CGSize(width: myViewWidth, height: scaledHeight)
        }

        return CGSize(width: -1.0, height: -1.0)
    }

}
~~~





### [ios\] Custom Cell을 재사용할 때 생기는 문제점

~~~swift
import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var stockLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        priceLabel.text = nil
        amountLabel.text = nil
    }
  
   // override func prepareForReuse() {
   // super.prepareForReuse()
   // self.subviews.forEach{$0.removeFromSuperview()}
   // 스텍뷰로 만드니까 안되넹;;;
  }
}

~~~



http://blog.zaemina.com/2014/11/ios-tableview.html

https://g-y-e-o-m.tistory.com/134

https://ko.programqa.com/question/57374026/



## 이미지 메모이제이션

https://gigas-blog.tistory.com/3









### UITableView didSelectRowAtIndex, trigger segue delay bug / lag

~~~swift
    let myVC = myViewController()
    let navi = UINavigationController(rootViewController: myVC)
    navi.modalPresentationStyle = .fullScreen
    DispatchQueue.main.async {
      self.present(navi, animated: true, completion: nil)
    } //해주면 바로 뜸

~~~







#### cell 재사용으로 인한 문제

~~~swift
// 사용자에게 입력 받은 text를 바로바로 저장해야 지워지지 않습니다.

import UIKit

 
protocol selectDelegate {
    func sendCell(selectText:tableCell, str : String)
}
 

class ViewController: UIViewController, selectDelegate {
    var selectRow : Int?
    var arr = [String](repeating: "", count: 100)   // 이 예제에서 100개의 cell 만들었음


    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        table.register(tableCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(table)


        NSLayoutConstraint.activate([
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            table.topAnchor.constraint(equalTo: view.topAnchor),
            table.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }

    let table : UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    func sendCell(selectText: tableCell, str: String) {
        if let index = table.indexPath(for: selectText) {
            arr[index.row] = str
        }
    }
}

 

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }

 

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as! tableCell
        cell.delegate = self
        cell.textField.text = arr[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 50

    }

}

class tableCell : UITableViewCell {

    var delegate : selectDelegate?
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(textField)
        textField.addTarget(self, action: #selector(textSelect), for: UIControl.Event.editingChanged)

 
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            textField.topAnchor.constraint(equalTo: topAnchor),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
    }

    

    @objc func textSelect() {
        delegate?.sendCell(selectText: self, str: textField.text ?? "")
    }

    let textField : UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
}

~~~



https://iphonedev.co.kr/iOSDevQnA/114004







### IndexSet

https://fluffy.es/how-to-expand-tableview-cell/





#### 헤더 빼고 셀만 리로드 

~~~swift
let indexes = (0..<tempArr.count).map { IndexPath(row: $0, section: 0) }
    tableView.reloadRows(at: indexes, with: .automatic)
~~~





#### 테이블뷰 뿌려줄 정보 없을때(라이브러리)

~~~swift
 import EmptyDataSet_Swift
 
 class MyVC: UIViewcomtaoller, EmptyDataSetSource, EmptyDataSetDelegate {
    
   private lazy var ticketTableView:UITableView = {
    let tableView = UITableView()
    
     tableView.emptyDataSetSource = self
     tableView.emptyDataSetDelegate = self
     tableView.emptyDataSetView { view in
     view.customView(self.backView)
     }
     
    return tableView
  }()
     
     private lazy var backView: EmptyStateImgView = {
    let backView = EmptyStateImgView(image: "packet", text: "입장권 내역이 없습니다.")
    view.addSubview(backView)
    return backView
  }()
 }
~~~



#### Tableview Expand/Collapse

~~~swift
  struct QnAData {
    var opened = Bool()
    var question = String()
    var answer = String()
  }
  
   var tableViewData = [QnAData(opened: false, question: "Q. 입장권 발급은 어떻게 하나요?", answer: "러블리마켓은 무료입장입니다.\n\n입장권 발급 방법은 해당 회차 마켓이 열리는 장소에 도착하신 후 입장권 발급 시스템을 통해서 받으실 수 있습니다.\n\n입장권을 발급 받으신 후 입장 시간 전까지 친구들과 주변에서 즐거운 시간을 보내시다가 입장 시간에 맞춰서 오시면 됩니다.\n\n러블리마켓 당일 반경 2km 이내에서 오전 9시부터 발급이 가능합니다."), QnAData(opened: false, question: "Q. 입장권 발급은 어떻게 하나요?", answer: "러블리마켓은 무료입장입니다.\n\n입장권 발급 방법은 해당 회차 마켓이 열리는 장소에 도착하신 후 입장권 발급 시스템을 통해서 받으실 수 있습니다.\n\n입장권을 발급 받으신 후 입장 시간 전까지 친구들과 주변에서 즐거운 시간을 보내시다가 입장 시간에 맞춰서 오시면 됩니다.\n\n러블리마켓 당일 반경 2km 이내에서 오전 9시부터 발급이 가능합니다."),QnAData(opened: false, question: "Q. 입장권 발급은 어떻게 하나요?", answer: "러블리마켓은 무료입장입니다.\n\n입장권 발급 방법은 해당 회차 마켓이 열리는 장소에 도착하신 후 입장권 발급 시스템을 통해서 받으실 수 있습니다.\n\n입장권을 발급 받으신 후 입장 시간 전까지 친구들과 주변에서 즐거운 시간을 보내시다가 입장 시간에 맞춰서 오시면 됩니다.\n\n러블리마켓 당일 반경 2km 이내에서 오전 9시부터 발급이 가능합니다.")
   ]

extension FleapopCenterView: UITableViewDelegate, UITableViewDataSource {
   func numberOfSections(in tableView: UITableView) -> Int {
    return tableViewData.count
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if self.tableViewData[section].answer.count ?? 0 > 0 {
      if self.tableViewData[section].opened ?? false {
        return 2
      } else {
        return 1
      }
    }
    return 1
  }
  
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let data = self.tableViewData[indexPath.section]
    
    if indexPath.row == 0 {
      let cell = tableView.dequeue(SellerCellTableViewCell.self)
      cell.selectionStyle = .none
      return cell
      
    } else {
      let cell = tableView.dequeue(OrderQuestionReplyTableCell.self)
      cell.selectionStyle = .none
      return cell
    }
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if indexPath.row == 0 {
      if self.tableViewData[indexPath.section].opened == true {
        self.tableViewData[indexPath.section].opened = false
        let sections = IndexSet.init(integer: indexPath.section)
        tableView.reloadSections(sections, with: .none)
      } else {
        self.tableViewData[indexPath.section].opened = true
        let sections = IndexSet.init(integer: indexPath.section)
        tableView.reloadSections(sections, with: .none)
      }
    }
  }
}
   
~~~





#### 이미지 받아와서 Crop

~~~swift
 func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    let imgURL = marketContentDataArr[indexPath.row].img.getURL()
    retutn getAPICropRatio(imgURL)
  }

  func getAPICropRatio(imgURL: URL) -> CGFloat {
    var width: CGFloat = 0.0
    var height: CGFloat = 0.0
    
    if let data = try? Data(contentsOf: imgURL) {
      let image: UIImage = UIImage(data: data)!
      width = image.size.width
      height = image.size.height
    }
    
    let aspectRatio = (height  / width)
    let imageHeight = UIScreen.main.bounds.width*aspectRatio
    
    return imageHeight
  }
~~~



#### 셀 클릭했을때 셀 안에 이벤트 전달

~~~swift
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if let cell = tableView.cellForRow(at: indexPath) as? StoreMainTableCell {
      cell.selectionStyle = .none
      selectedCell = cell
      self.selectedIndex = indexPath
    }
~~~

