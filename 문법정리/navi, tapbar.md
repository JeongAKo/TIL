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



##### 네비바 사이즈 맞춰서 정렬해주기

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

