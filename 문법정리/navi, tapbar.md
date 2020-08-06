https://zeddios.tistory.com/574

### Navigation Controller

```swift
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
 
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        
        let vc = ViewController()
        let naviController = UINavigationController(rootViewController: vc)
        window?.rootViewController = naviController
        window?.makeKeyAndVisible()
        
        return true
    }   
}
```

~~~swift
let viewController = MyViewController()
let nav = UINavigationController(rootViewController: viewController)
self.navigationController?.present(nav, animated: true, completion: nil)
~~~



##### 네비게이션 아이템 타이틀 설정

~~~swift
navigationItem.title = "FirstVC"

//custom
   self.navigationController?.navigationBar.topItem?.title = "댓글수정"
    let titleAttributes = [
      NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: FontSize.f32)
     ]
    self.navigationController?.navigationBar.titleTextAttributes = titleAttributes
//

// or
title = "FirstVC"

// *버젼구분*
//  아래코드의 LargeTitles는 iOS 11 이상부터 적용 
if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
~~~



##### 뒤로가기 왼쪽 네비버튼 만들기

~~~swift
 navigationItem.title = "장바구니"
    self.navigationController?.navigationBar.tintColor = UIColor.appColor(.black_17)
    let newBtn = UIBarButtonItem(image: UIImage(named: "fp_b_line_left"), style: .plain, target: self, action: #selector(actionBackBtn))
    self.navigationItem.leftItemsSupplementBackButton = true
    self.navigationItem.leftBarButtonItem = newBtn
    
     @objc func actionBackBtn(_ sender: UIBarButtonItem) {
    print("Back")
    self.dismiss(animated: false, completion: nil)
  }
~~~





##### 네비게이션 바 버튼아이템 설정

~~~swift
		let barButton = UIBarButtonItem(title: "push", style: .done, target: self, action: #selector(pushViewControlle))
        navigationItem.rightBarButtonItem = barButton
    }

    @objc private func pushViewControlle(_ sender: Any) {
        let secondVC = SecondViewController()
        navigationController?.pushViewController(secondVC, animated: true)
    }
~~~



네비게이션 바 중복으로 배치하고 싶을때

![IMG_455994B8FA2D-1](https://user-images.githubusercontent.com/47776915/73238614-f0654280-41dc-11ea-9fc8-7f360542e5d5.jpeg)

~~~swift
navigationController?.navigationBar.barTintColor = .gray
navigationController?.navigationBar.barStyle = .black
navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "baseline-menu-24px"), style: .plain, target: self, action: #selector(hadleMenufunc))
    let first = UIBarButtonItem(title: "first",  style: .plain, target: self, action: #selector(hadleMenuToggle))
    let second = UIBarButtonItem(title: "second", style: .plain, target: self, action: #selector(hadleMenuToggle))

    navigationItem.rightBarButtonItems = [first, second] //배열의 처음이 제일 오른쪽으로 간다

    second.imageInsets = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: -25) // second 이미지 일경우 이미지 위치 조정해줘야 한다 아니면 너무 떨어져서 나옴
~~~

[참고](https://hcn1519.github.io/articles/2018-03/barbuttoncircleimage)



##### 네비바 이미지 정렬해주기

~~~swift
 self.navigationController?.navigationBar.tintColor = UIColor.appColor(.dddddd)
    navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "baseline-menu-24px"), style: .plain, target: self, action: #selector(hadleMenuToggle))
    
    let filterImage = UIImage(named: "fp_b_filter_1_80")
    let filterResize = filterImage?.resizeImage(size: CGSize(width: 32, height: 32))
    
    let searchImage = UIImage(named: "fp_b_search_1_80")
    let searchResize = searchImage?.resizeImage(size: CGSize(width: 32, height: 32))
    
    let filter = UIBarButtonItem(image: filterImage, style: .plain, target: self, action: #selector(tappedFilter))
    
    let search = UIBarButtonItem(image: searchResize, style: .plain, target: self, action: #selector(tappedSearch))
    search.imageInsets = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: -25)

    navigationItem.rightBarButtonItems = [filter, search] //배열의 처음이 제일 오른쪽으로 간다
~~~



##### 네비바 이미지 정렬 버튼생성 후 네비바 아이템으로 등록

~~~swift
//카테고리필터
    let filterbtn: UIButton = UIButton(type: .custom)
    let filterImg = UIImage(named: "fp_b_filter")?.withRenderingMode(.alwaysTemplate)
    filterbtn.setImage(filterImg, for: .normal)
    filterbtn.tintColor = UIColor.appColor(.gray_999)
    filterbtn.addTarget(self, action: #selector(actionCategoryFilter), for: .touchUpInside)
    filterbtn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
    let filter = UIBarButtonItem(customView: filterbtn)
    
    //장바구니
    let basketbtn: UIButton = UIButton(type: .custom)
    let basketImg = UIImage(named: "fp_b_basket")?.withRenderingMode(.alwaysTemplate)
    basketbtn.setImage(basketImg, for: .normal)
    basketbtn.tintColor = UIColor.appColor(.gray_999)
    basketbtn.addTarget(self, action: #selector(actionShoppingCart), for: .touchUpInside)
    basketbtn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
    let basket = UIBarButtonItem(customView: basketbtn)
    
    // 검색
    let searchBtn: UIButton = UIButton(type: .custom)
    let searchImg = UIImage(named: "fp_b_search_1_80")?.withRenderingMode(.alwaysTemplate)
    searchBtn.setImage(searchImg, for: .normal)
    searchBtn.tintColor = UIColor.appColor(.gray_999)
    searchBtn.addTarget(self, action: #selector(actionSearch), for: .touchUpInside)
    searchBtn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
    let search = UIBarButtonItem(customView: searchBtn)
    
    navigationItem.rightBarButtonItems = [filter, search, basket] //배열의 처음이 제일 오른쪽으로 간다
~~~





### TabBar Controller

~~~swift
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        
        let tapBarController = UITabBarController()
        let firstVc = ViewController()
        let secondVc = SecondViewController()
        let thirdVc = ThirdViewController()
        
        let naviController = UINavigationController(rootViewController: firstVc)
        let naviC2 = UINavigationController(rootViewController: thirdVc)
        
      //뷰컨트롤러 안에 뷰디드 로드에 쓰면 텝 하기 전까지 로드가 안되어서 처음에 보이지 않는 문제가 발생한다.
      //그래서 여기서 지정해주는 것 
        secondVc.title = "친구추가"
        firstVc.title = "친구"
        thirdVc.title = "설정"
      
      
        tapBarController.viewControllers = [naviController, naviC2] // 텝바에 넣어주기
        
        firstVc.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
        thirdVc.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)
        
        window?.rootViewController = tapBarController
        window?.makeKeyAndVisible()
        
        return true
    }
}
~~~







~~~swift
 override func viewWillAppear(_ animated: Bool) {

        super.viewWillAppear(animated)

        self.navigationController?.isNavigationBarHidden = true

        또는 //self.navigationController?.navigationBar.isHidden = true

    }



 override func viewWillDisappear(_ animated: Bool) {

        super.viewWillDisappear(animated)

        self.navigationController?.isNavigationBarHidden = false

        또는 //self.navigationController?.navigationBar.isHidden = false

    }


~~~

위 코드는 해당 navigationController로 묶인 모든 ViewController들의 navigationBar를 숨기므로 disAppear에서 다시 false로 해줘야함.





#### 탭바 한번 더 눌렀을때 처리

~~~swift
class MyClass: UIViewController, UITabBarControllerDelegate {

   func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let tabBarIndex = tabBarController.selectedIndex
        if tabBarIndex == 0 {
            //do your stuff
        }
   }

   override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.delegate = self
   }
}

~~~



### tabbar Height

~~~swift
  let tabbarHeight = self.tabBarController?.tabBar.frame.height ?? 0
~~~



### dismiss 한 뒤 바로 present 하는 방법

~~~
    guard let pvc = self.presentingViewController else { return }

    self.dismiss(animated: false) {
      pvc.present(naviVC, animated: true, completion: nil)
    }
    
참조 : https://developer-fury.tistory.com/56
~~~



### 모든 modal 한번에 내리기

~~~swift
 self.view.window?.rootViewController?.dismiss(animated: true) {
 // Your Code
 }
~~~



#### Navi TitleView

~~~swift
    let titleImageView = NavigationImageView()
    titleImageView.image = UIImage(named: "LMlogo")
    navigationItem.titleView = titleImageView
    
class NavigationImageView: UIImageView {
       override func sizeThatFits(_ size: CGSize) -> CGSize {
           return CGSize(width: 50, height: 50)
       }
}

~~~



~~~swift
extension UIBarButtonItem {

  static func setButton(_ target: Any?, action: Selector, imageName: String) -> UIBarButtonItem {
    let button = UIButton(type: .custom)

    // 버튼 이미지에 색 넣는 전처리
    button.setImage(UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate), for: .normal)
    button.addTarget(target, action: action, for: .touchUpInside)
    button.tintColor = .darkGray

    let menuBarItem = UIBarButtonItem(customView: button)
    menuBarItem.customView?.translatesAutoresizingMaskIntoConstraints = false
    menuBarItem.customView?.heightAnchor.constraint(equalToConstant: 30).isActive = true
    menuBarItem.customView?.widthAnchor.constraint(equalToConstant: 30).isActive = true

    return menuBarItem
  }
}
~~~



#### 네비바를 커스텀 했을때 영역 오류

~~~swift
import UIKit


class MyUIView: UIView {
  override var intrinsicContentSize: CGSize {
	}
}

출처: https://abc1211.tistory.com/category/ios 뽀개기?page=12 [길위의 개발자]
~~~





#### 네비게이션 bottom Border

**Removing border:**

~~~swift
self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
self.navigationController?.navigationBar.shadowImage = UIImage()
self.navigationController?.navigationBar.layoutIfNeeded()
~~~



**Restoring border:**

~~~swift
self.navigationController?.navigationBar.setBackgroundImage(nil, for:.default)
self.navigationController?.navigationBar.shadowImage = nil
self.navigationController?.navigationBar.layoutIfNeeded()
~~~





#### 타이틀 폰트 변경하기

~~~swift
let attributes = [NSAttributedString.Key.font: UIFont.NanumExtraBold(size: 17)]
    UINavigationBar.appearance().titleTextAttributes = attributes
    self.navigationItem.title = "카테고리명🏠"
~~~



