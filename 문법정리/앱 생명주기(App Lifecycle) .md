# 1앱 생명주기(App Lifecycle) 



#### Execution States of Apps

**Not Running**: 앱이 실행되지 않은 상태
**Inactive**(Foreground): 앱이 실행중 이지만 이벤트를 받고 있지 않은 상태로 미리알림 또는 일정 얼럿이 화면에 덮여서 앱이 실질적으로 이벤트를 받지 못하는 상태
**Active**(Foreground): 앱이 실행중이며 이벤트가 발생한 상태
**Background**: 앱이 백그라운드에 있는 상태에서 실질적인 동작을 하고 있는 상태  (실행되는 코드가 있는 상태)
**Suspened**: 앱이 백그라운드 상태에서 활동을 멈춘상태.

<img width="383" alt="스크린샷 2019-10-28 오후 2 58 42" src="https://user-images.githubusercontent.com/47776915/67655298-7b8f2c00-f993-11e9-8578-a9dc843a4587.png">



#### Delegate Call

App이 상태 변화가 일어나면 AppDelegate에 구현된 `UIApplicationDelegate` method들이 호출됩니다.

App의 상태 변화에 따라 의도한 custom code를 실행시킬 수 있습니다.



- ```swift
  application(_:willFinishLaunchingWithOptions:)
  ```

  - App 실행을 위한 초기화가 완료되기 직전에 호출됩니다.
  - 주로 App 실행 시 최초로 실행할 코드를 작성합니다.

  

- ```
  application(_:didFinishLaunchingWithOptions:)
  ```

  - App이 실행되고 화면이 사용자에게 보여지기 직전에 호출됩니다.
  - 주로 App 실행 후에 최종 초기화 코드를 작성합니다.
  - Not Running -> Foreground

  

- ```
  applicationDidBecomeActive(_:)
  ```

  - App이 Not Running 상태에서 Foreground(Inactive, Active) 상태로 진입할 때 호출됩니다.
  - 주로 App이 실제로 사용되기 전에 마지막으로 준비할 수 있는 코드를 작성합니다.

  

- ```
  applicationWillResignActive(_:)
  ```

  - App이 Foreground(Active) 상태에서 다른 상태로 진입할 때 호출됩니다.
  - 주로 App이 quiescent(조용한) 상태로 변환될 때의 작업을 진행합니다.

  

- ```
  applicationDidEnterBackground(_:)
  ```

  - App이 Background 상태에 진입했을 때 호출됩니다.
  - 특별한 처리가 없으면 Background 상태에서 Suspended 상태로 전환됩니다.
  - App이 Suspended 상태로 진입하기 전에 중요한 데이터를 저장하거나 점유하고 있는 공유 자원을 해제하는 등 종료되기 전에 준비 작업을 진행합니다.
  - App이 종료된 이후 다시 실행될 때 직전 상태를 복구할 수 있는 정보를 저장합니다.

  

- ```
  applicationWillEnterForeground(_:)
  ```

  - App이 Background에서 Foreground로 돌아오기 직전 호출됩니다.
  - Method가 호출된 뒤 Inactive 상태를 거쳐 Active 상태로 진입합니다.

  

- ```
  applicationWillTerminate(_:)
  ```

  - App이 종료되기 직전에 호출됩니다. App이 곧 종료될 것임을 알려줍니다.
  - 다음 경우에는 호출되지 않습니다.
    1. 메모리 확보를 위해 Suspended 상태에 있는 app을 종료시킬 때
    2. 사용자가 multitasking UI를 통해 종료할 때
    3. 오류로 인해 app이 종료될 때
    4. Deivce를 재부팅할 때



#### 뷰 컨트롤러 생명주기(ViewController Lifecycle)

<img width="745" alt="스크린샷 2019-10-28 오후 2 54 51" src="https://user-images.githubusercontent.com/47776915/67655093-e724c980-f992-11e9-8ea8-888665822e5d.png">



~~~swift
  override func viewDidLoad() {
   /* 해당 뷰컨트롤러 클래스가 생성될 때(ViewWillAppear전에 실행) 실행됩니다. 메모리에 로드된 후 호출됩니다. 딱 한		 번만 실행되기 때문에 `초기화` 할 때 사용 할 수 있습니다. `loadView()`직 후 에 호출되는 콜백메소드입니다.*/
  }
  override func viewWillAppear(_ animated: Bool) {
    /* 뷰 컨트롤러가 화면에 나타나기 직전에 실행됩니다. 뷰 컨트롤러가 나타나기 직전에 항상 실행되기 때문에 
    해당 뷰 컨트롤러가 나타나기 직전마다 일어나는 작업들을 여기에 배치 시킬 수 있습니다. */
  }
  override func viewDidAppear(_ animated: Bool) {		
    /* 뷰 컨트롤러가 화면에 나타난 직후에 실행됩니다. 화면에 적용될 애니메이션을 그리거나 API로 부터 정보를 받아와
    화면을 업데이트 할 때 이곳에 로직을 위치시키면 좋습니다. 왜냐하면 지나치게 빨리 애니메이션을 그리거나 
    API에서 정보를 받아와 뷰 컨트롤러를 업데이트 할 경우 화면에 반영되지 않습니다. */
  }

  override func viewWillDisappear(_ animated: Bool) {
    /* 뷰 컨트롤러가 화면에 나타난 직전에 실행됩니다. 뷰를 삭제하기 전에 호출되므로 데이터는 존재합니다. */
  }
  override func viewDidDisappear(_ animated: Bool) {
    /* 뷰 컨트롤러가 뷰 계층구조에서 제거되었을 때 실행됩니다.*/
  }
~~~





## App Life Cycle

<img width="814" alt="스크린샷 2019-10-28 오후 7 14 00" src="https://user-images.githubusercontent.com/47776915/67670368-1a794f80-f9b7-11e9-9fed-0f9442564f2b.png">