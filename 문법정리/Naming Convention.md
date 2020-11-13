## Naming Convention for Swift



- 클래스명, 변수명은 명사를 사용하여 작명하라.
- 함수명은 동사로 시작해야 한다.
- enum은 형용사로 시작한다.



https://soojin.ro/blog/english-for-developers-swift 참고

### \#1. 동사의 변형

#### ✏️동사원형

- 메서드명
  - 일반적은 메서드명으로는 **동사원형**으로 시작.
    **request~, make~, show~, add~ 등등**
  - delegate 메서드는(조동사 + 동사원형)으로 자주 쓰임

~~~swift
optional public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])

optional public func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion)

optional public func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath?

optional public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
~~~



- 변수명
  - 동사의 의미로 변수명을 사용해야될때 **과거 분사로 변형**해서 사용한다.

~~~swift
var fetchedData: 
var requestedData: 
var madeView:
var hiddenView: 
~~~



- 조동사

  - `canBecomeFirstReponder`, `shouldRefresh` 등

- LifeCycle관련 delegate 메서드(조동사 + 동사원형)

  - `didFinish `, `WillAppear`, `didComplete` 등

  

#### ✏️과거분사

동사의 의미를 형용사로 쓰고 싶을 때는 과거 분사로 변형해서 사용해야 한다.

- 명사 수식

  - `requestedData`, `hiddenView`

- Bool 변수

  - `isHidden`, `isSelected`

  

### #2 단수와 복수

보통 인스턴스 하나는 단수형으로 이름 짓고 어레이 타입은 복수형으로 이름 지어준다. 복수형으로 이름 지어주는 것만으로 배열이라는 걸 알 수 있으니 특수한 경우가 아니라면 `List`나 `Array`를 뒤에 붙여줄 필요는 없지 않을까 싶다.

```swift
let album: Album
let albums: [Album]

let albumList: [Album]
let albumArray: [Album]
```



#### ✏️ 불규칙 복수형

복수형을 쓸 때 고려해야할 건 단어마다 복수형이 조금씩 다르다는 것이다. 대다수의 경우 -s를 붙이면 되지만 -es일때도 있고 -ies일수도 있고 새로운 단어로 바뀔 수도 있다. 안 바뀔수도..

| 단수        | 복수                 |
| ----------- | -------------------- |
| view        | views                |
| box         | boxes                |
| half        | halves               |
| category    | categories           |
| child       | children             |
| person      | people               |
| index       | indices 혹은 indexes |
| datum       | data                 |
| information | information          |



### #3 타입별 Naming Conventions

좀 전에 배열 타입의 변수에 굳이 `List`나 `Array`라는 타입을 명시하지 않는다고 했는데 Cocoa Touch 프레임워크 전반에 걸쳐 타입을 변수명에 명시해 주는 경우가 있다. `URL`, `UIImage`, `Date`, `Size`, `Data`처럼 상대적으로 raw한 데이터 타입이라면 명시해 주는 것 같고, 새로 정의한 타입이라면 써줄 필요가 없을 것 같다.

```swift
var fullSizeImageURL: URL?     //PHContentEditingInput
var thumbnailURL: URL?         //MLMediaObject
var referenceURL: URL          //SCNReferenceNode

var referenceImage: ARReferenceImage?   //ARImageAnchor
var iconImage: NSImage?                 //MLMediaGroup

var physicalSize: CGSize               //ARReferenceImage
var startDate: Date 
var adjustmentData: PHAdjustmentData?  //PHContentEditingInput
```

#### ✏️ `id` vs `Id` vs `ID` vs `identifier`

프레임워크 문서를 보다가 또 한가지 발견한 것. Cocoa Touch에서는 대부분 `identifier`를 쓰고 별도의 타입을 쓸 때는 `ID`를 쓴다. 근데 이것도 절대 규칙은 아닌것 같고.. *“대체로”* 그렇다.

```swift
var formatIdentifier: String { get }          //PHAdjustmentData  
var identifier: String { get }                //CLRegion          
var identifier: String { get }                //MLMediaGroup 
var objectID: NSManagedObjectID { get }       //NSManagedObject
var recordID: CKRecordID { get }              //CKRecord          
var uniqueID: String? { get }                 //AVMetadataGroup 
```



### #4 Bool 변수

Bool 변수명을 지을 때 알아두면 좋은 문법 몇 가지는 [Bool 변수 이름 제대로 짓기 위한 최소한의 영어 문법](https://soojin.ro/blog/naming-boolean-variables)에서 자세히 다뤘었고, 컨벤션적인 측면에서도 고려할 것이 몇 가지 있다.

#### ✏️ `isSelected` vs `selected`

문법적으로만 보면 `isSelected`과 `selected` 둘 다 맞다고 할 수 있으니 각 언어나 개발 플랫폼마다의 컨벤션을 따르면 되겠다. 스위프트에서는 `is`를 써주는 것이 컨벤션이다보니 맞춰주면 좋을 것 같다.

#### ✏️ `isEnabled` vs `isDisabled`

Bool 타입의 경우 반대어를 써서 동일한 기능을 하는 이름을 만들 수 있다. 둘 중 뭐가 나은지 정답은 없지만 고민해볼 만한 기준은 있다. 조건문에 not 연산자를 붙이는 것 보다는 없는 것이 가독성에 조금 더 좋다. 따라서 로직이 추가되는 경우가 true가 되도록 하는 단어를 선택하면 어떨까. 또 하나는 변수의 디폴트 값이 true가 되도록 하는 것이다. `UIView`의 경우 **‘보여지는’** 상태가 디폴트임에도 `isHidden`을 쓰고 있어서 종종 뇌에 혼란이 올 때가 있다.

```
if isEnabled { ... }
if !isEnabled { ... }

tableView.isVisible = !items.isEmpty  //"tableView가 보일 때는 items가 비어있지 않을 때"
tableView.isHidden = items.isEmpty    //"tableView가 숨어있을 때는 items가 비어있을 때"
```



1. #### is + 명사 : “ ~인가?” 라고 해석

~~~swift
open var isFirstResponder: Bool { get }
open func isDescendant(of view: UIView) -> Bool
~~~



2. #### **is ~ ing :** “ ~하는 중인가?” 라고 해석

~~~swift
open var isRefreshing: Bool { get }
open var isTracking: Bool { get }
~~~



3. #### is ~ 형용사 : “~되어진, ~하게된” 이라고 해석

~~~swift
open var isFocused: Bool { get }
open var isMultipleTouchEnabled: Bool
var isOpaque: Bool { get set }
var isSelected: Bool { get set }
var isHighlighted: Bool { get set }
~~~



4. #### 조동사(can, should, will 등) 

- can : “~ 할 수 있는가?”
- should, will : “무엇을 하기전에 ~할 것인가?”

~~~swift
pen var shouldGroupAccessibilityChildren: Bool
open var canBecomeFirstResponder: Bool { get }
open var shouldAutorotate: Bool { get }
~~~



5. #### 3인칭 단수 동사원형

- shows~ : ~ 보여줄 것인가?
- contains~ : ~ 포함하고 있는가?
- includes~ : ~ 포함하고 있는가?
- allows~ : ~ 허용하고 있는가?
- support~ : ~ 지원하고 있는가?
- accept~ : ~ 받아주는가?
- preserves~ : ~보존할건가?
- returns ~ : ~을 반환할것인가?



6. #### has + 명사, has + 과거 분사

- **has + 명사** : “~를 가지고 있는가”로 해석
- **has + 과거분사** : “과거에 완료된것이 현재유지되고있다” →  “유지되고 있는가?”라는 의미이지만 “is + 과거분사”처럼 해석해도된다.

~~~swift
var hasConnected: Bool { get }
var hasEnded: Bool { get }
~~~





### #5 중복 제거

의미가 중복되는 단어가 많으면 읽기 좋은 글이 아니다. 코드도 마찬가지로 불필요하게 의미가 중복되는 것을 빼버리면 간결하고 읽기 좋은 코드가 될 것이다.

```swift
struct User {
  let userID: String
}
```

`userID`는 떼어놓고 보면 의미가 명확하고 잘 지은 변수명이지만 실제 쓰일 때는 User 인스턴스와 함께 쓰일 것이기 때문에 굳이 ‘user’라는 의미를 포함시키지 않아도 된다. `identifier`라고만 해줘도 충분하다.

```swift
let id = user.userID
let id = user.identifier
```

함수나 메서드 이름을 지을 때도 마찬가지다.

```swift
struct ImageDownloader {
  func downloadImage(from url: URL) { ... }
}
```

`downloadImage(from:)`도 잘 지은 것 처럼 보이지만 실제로 사용해보면 image와 download라는 단어가 불필요하게 중복된다.

```swift
let image = imageDownloader.downloadImage(from: url)
```

메서드가 사용될 때의 인스턴스 이름까지 고려해서 아래와 같이 중복을 제거해볼 수 있을 것이다.

```swift
let image = imageDownloader.fetch(from: url)
let image = imageManager.download(from: url)
```

등등.



## \#6. request, fetch

#### request

- 유저에게 사용자 권한이나 요청등을 할때 사용.
- 비동기 작업을 통해 handler를 이용하여 결과나 에러가 발생하여 실패할 수 있을때 사용.

~~~swift
//PHImageManager
func requestImage(for asset: PHAsset, targetSize: CGSize, contentMode: PHImageContentMode, options: PHImageRequestOptions?, resultHandler: @escaping (UIImage?, [AnyHashable : Any]?) -> Void) -> PHImageRequestID

//PHAssetResourceManager
func requestData(for resource: PHAssetResource, options: PHAssetResourceRequestOptions?, dataReceivedHandler handler: @escaping (Data) -> Void, completionHandler: @escaping (Error?) -> Void) -> PHAssetResourceDataRequestID

//CLLocationManager
func requestAlwaysAuthorization()
func requestLocation()

//MLMediaLibrary
class func requestAuthorization(_ handler: @escaping (MPMediaLibraryAuthorizationStatus) -> Void)

~~~



### fetch

- 요청이 실패하지 않고, 결과를 바로 리턴해줄때사용.

~~~swift
//PHAsset - Photos Framework
class func fetchAssets(withLocalIdentifiers identifiers: [String], options: PHFetchOptions?) -> PHFetchResult<PHAsset>

//PHAssetCollection - Photos Framework
class func fetchAssets(in assetCollection: PHAssetCollection, options: PHFetchOptions?) -> PHFetchResult<PHAsset>

//NSManagedObjectContext - Core Data
func fetch<T>(_ request: NSFetchRequest<T>) throws -> [T] where T : NSFetchRequestResult
~~~





