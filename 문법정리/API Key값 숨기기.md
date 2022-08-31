## API Key값 숨기기

1. #### xcconfig 로 관리
   
   - xcconfig파일은 info.plist에서 접근 가능

<img width="842" alt="스크린샷 2022-08-17 오후 10 05 11" src="https://user-images.githubusercontent.com/47776915/185141784-174d5793-de83-4919-98f3-f5dfebcd4628.png">

<img width="1041" alt="스크린샷 2022-08-17 오후 10 54 34" src="https://user-images.githubusercontent.com/47776915/185152124-0a3708b4-ac0d-4b64-a1b8-e4709be12c83.png">

<img width="707" alt="스크린샷 2022-08-17 오후 10 55 18" src="https://user-images.githubusercontent.com/47776915/185152656-8fc9dab1-c6b9-458d-ba22-011b28c89e4d.png">

- info.plist에서 좌측 key값은 .swift파일에서 접근, 우측 value값은 .xccconfig로부터 읽어오는 것

<img width="1208" alt="스크린샷 2022-08-17 오후 11 02 00" src="https://user-images.githubusercontent.com/47776915/185154323-c393770d-3712-4261-b1d3-d5c766942ddf.png">

Secrets.xcconfig 파일을 사용할 수 있도록 Project Info에 Secrets 파일을 추가

```swift
guard let accessToken = Bundle.main.object(forInfoDictionaryKey: "ACCESS_TOKEN") as? String else {return}
```

2. ##### PropertyList(Plist)로 관리

<img width="842" alt="스크린샷 2022-08-17 오후 10 59 05" src="https://user-images.githubusercontent.com/47776915/185153201-b84f31cd-6c96-4087-a393-8424885863d9.png">

api key나 토큰을 저장해 둘 PropertyList 추가

기존에 있던 plist에 저장해도 되지만 많아진다면 조금 더 편하게 관리하고 또한 깃 추적 방지를 위해 파일을 아예 빼두었다

<img width="815" alt="스크린샷 2022-08-17 오후 11 23 49" src="https://user-images.githubusercontent.com/47776915/185159193-1a1f1ff7-638f-483a-8ebb-7063a6444990.png">

#### Bundle extiension으로 빼기

```swift
extension Bundle {
  var apiKey: String {
    guard let file = self.path(forResource: "MyKeyInfo", ofType: "plist") else { return "" }

    guard let resource = NSDictionary(contentsOfFile: file) else { return "" }
    guard let key = resource["API_KEY"] as? String else {fatalError("MyKeyInfo.plist에 API_KEY설정을 해주세요")}
    return key
  }
}


// let accessToken = Bundle.main.accessToken 바로 불러올수 있다
```

#### gitIgnore설정

```bash
// xcconfig 로 관리시
 *.xcconfig


// plist 로 관리시
// Note the forward slash(/) in the end.

git update-index --skip-worktree 자신의프로젝트명/MyKeyInfo.plist/  


// or

//.gitignore 파일 수정 -> commit, push -> 임시로 넣은 string 값에서 실제 API Key 값을 입력 후 git이 .plist 파일을 추적하는지 안하는지 확인
```

.gitignore 세팅을 하기 전에 .plist 파일을 만들면 git은 처음에 만든 .plist 파일을 계속 포함시키기 때문에 맨 처음부터 .gitignore 에 해당 파일을 추가하거나 임시로 string 값 넣고 .gitignore 파일 수정, push 하고나면 그 뒤부터는 생성한 .plist 파일을 추적하지 않습니다.

![스크린샷 2022-08-18 오후 5 59 54](https://user-images.githubusercontent.com/47776915/185355506-a7ebd3fc-287f-4077-9797-0e14644d65ce.png)





[gitignore xcconfig ( api key가 git에 추가되지 않도록 하기)](https://ggasoon2.tistory.com/18)

[github에 올리면 안되는 APIKEY 숨기기 - iOS](https://nareunhagae.tistory.com/44)

https://velog.io/@leedool3003/iOS-API-Key-%EC%88%A8%EA%B8%B0%EA%B8%B0

[[iOS - swift] iOS 프로젝트 배포 환경별 build 세팅, Build Scheme 세팅 (단일타겟, xcconfig)](https://ios-development.tistory.com/428)




