# Tuist

Tuist는 XcodeGen과 더불어 Xcode 프로젝트 파일의 생성및 관리할 수 있는 도구

XcodeGen은 프로젝트 설정을 YML로 관리 하는 반면에 Tuist는 Swift 언어로 관리

##### Tuist 적용하기

시작전에 Xcode프로젝트를 닫고 `MovieInfo.xcodeproj`, `MovieInfo.xcworkspace` 파일을 지운다

1. ##### installing Tuist

```swift
bash <(curl -Ls https://install.tuist.io)
```

2. ##### `Manifests` 빈 폴더 생성

3. ```swift
   // Manifests 폴더 안에 생
   touch Project.swift
   ```

4. ```swift
   tuist edit
   ```

![2-xcode-tuist-project-1-650x268](https://user-images.githubusercontent.com/47776915/167323651-b7afd616-8170-4cf6-ad55-fe79d123100a.png)

5. ```swift
   import ProjectDescription
   ```

6. ```swift
   // 1
   let project = Project(
     // 2
     name: "MovieInfo",
     // 3
     organizationName: "<YOUR_ORG_NAME_HERE>",
     // 4
     settings: nil,
     // 5
     targets: [])
   ```

`.project`, `.workspace` 를 대신해서 project파일을 만들었다.

이름은 바꿀수 있으나 권장사항은 `project` 이다.

`organizationName` 은 새로 생선되는 상단에 copyright 이름

7. `targets` array에 추가            

```swift
// 1
Target(
  // 2
  name: "앱이름",
  // 3
  platform: .iOS,
  // 4
  product: .app,
  // 5
  bundleId: "<YOUR_BUNDLE_ID_HERE>",
  // 6
  infoPlist: "MovieInfo/Info.plist",
  // 7
  sources: ["MovieInfo/Source/**"],
  // 8
  resources: ["MovieInfo/Resources/**"],
  // 9
  dependencies: [],
  // 10
  settings: nil)
```

```swift
tuist lint project
```

```swift
tuist generate
```

```swift
xed .
```

> *Note*: `xed .` opens a workspace in the current directory, if one exists. If not, it will open an Xcode project. So, in either case, it opens the "correct" file.

Build and run. The app will behave exactly as before, but there's a huge difference: You've removed the dependency on the project file and can now generate it whenever you want.

##### Focus Mode

```swift
tuist focus MovieInfo
```

##### Adding Support for Settings Files

```swift
tuist edit
```

Open *Project.swift* and add the following just after the `import`

```swift
// 1
let projectSettings = Settings(
  // 2
  debug: Configuration(xcconfig: Path("config/MovieInfoProject.xcconfig")),
  release: Configuration(xcconfig: Path("config/MovieInfoProject.xcconfig")),
  defaultSettings: .none)
```

Now update the `settings` parameter in the initialization of the `Target` object, to the following:

```swift
settings: targetSettings)
```

```swift
tuist generate
```

[참고 raywnederlich]([Tuist Tutorial for Xcode | raywenderlich.com](https://www.raywenderlich.com/24508362-tuist-tutorial-for-xcode))
