# UIPageViewController	



단순하게 addsubView를 하면 부모자식관계는 성립하지 않는다

`addChideViewController `를  이용해서 자식 컨트롤러를 추가합니다.

추가 완료된 이후에는 부모컨트롤러에서 `didMove:` 를 호출해 줘야 합니다

`removeFromPaentViewController` 를 이용해 자식컨트롤러를 제거합니다.

제거 순서는 자식의 부모뷰를 Container View 계층에서 제거 한 후, 자식과 부모는 Container View Controller와 연결을 끊어야 합니다.



https://www.linkedin.com/pulse/using-ios-pageviewcontroller-without-storyboards-paul-tangen

https://g-y-e-o-m.tistory.com/119



##### 코드로 AddViewController를 호툴한 부분

~~~swift
// addChildController
    @IBAction func onAddChildController(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Other", bundle: nil)
        let addViewController = storyboard.instantiateViewController(withIdentifier: "AddViewController")
        // if Constraints
//        addViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        self.addChildViewController(addViewController)
        self.view.addSubview(addViewController.view)
        
        // if Constraints
//        self.view.addConstraints(addViewController.view.constraints)
        
        addViewController.didMove(toParentViewController: self)
    }
~~~



##### 코드 부분으로 추가한 AddViewController의 내부 소스 부분

~~~swift
import UIKit

class AddViewController: UIViewController {
    
    deinit {
        // check remove self
        print(#function)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TEST backgroundColor
        view.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
    }
    
    // willMove -> It appears on the parent screen.
    override func willMove(toParentViewController parent: UIViewController?) {
        print(#function)
        if let `parent` = parent as UIViewController? {
            print(parent)
        }
    }
    
    // It appears on the parent screen. -> didMove
    override func didMove(toParentViewController parent: UIViewController?) {
        print(#function)
        if let `parent` = parent as UIViewController? {
            print(parent)
        }
    }
    
    // remove child view controller
    @IBAction func onRemoveChildViewController(_ sender: Any) {
        // Notify the parent to remove it by calling willMove.
        // willMove 를 호출해서 제거한다는 것을 알립니다.
        self.willMove(toParentViewController: nil)
        // Remove Constraint.
        // 제약사항 제거
        self.view.removeFromSuperview()
        // Remove the relationship of the child connected to the parent.
        // 부모에 연결된 자식의 관계를 제거합니다.
        self.removeFromParentViewController()
    }
}
~~~





##### pageIndicator 색상 설정

~~~swift
class AppDelegate: UIResponder, UIApplicationDelegate {
    
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    let pageControl = UIPageControl.appearance()
    pageControl.currentPageIndicatorTintColor = .black
    pageControl.pageIndicatorTintColor = .lightGray

  }
}
~~~



##### PagwViewCon으로 따로 생성 했을때  transitionStyle 바꾸고 싶을때

~~~swift
override init(transitionStyle style: UIPageViewControllerTransitionStyle, navigationOrientation: UIPageViewControllerNavigationOrientation, options: [String : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: options)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

~~~

