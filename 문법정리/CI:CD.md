# 배포 자동화

**CI**  `지속적인 통합 (continuous Intergration)` `(빌드/테스트 자동화)`를 의미

**CD** `지속적인 서비스 제공(Continuous Delivery)` 또는 `지속적인 배포(Continuous Deployment)`

**CI(Continuous Integration)**

- 여러 개발자들이 같은 애플리케이션을 동시에 작업할 수 있도록 하는 것이 목표

- 여러 개발자들 간에 서로 코드 충돌을 방지하는 것이 목적

- 개발자들이 적용한 변경사항이 버그 테스트를 거쳐 공유 레포지터리(SVN or GitHub)에 병합되는 것을 뜻한다.

- 자동화된 테스트에서 기존코드와 신규코드간에 충돌이 발견되면, CI를 통해 버그를 더 빠르고 자주 수정할 수 있음.

- 각각의 PR단위에서는 문제가 없었지만 빌드가 되지 않는 경우가 있음

## Why github Action?

젠킨스는 다양한 IDE를 지원하고 커스터마이징이 다양, 문서도 다양

하지만, 호스팅을 직접 하나부터 열까지 모두 해야하기에 관련된 모든 문서를 관리해야하는 부분과 서버 설치 운영 및 관리 비용이 발생비용이 발생합니다. 이로 인해 젠킨스는 규모가 작은 프로젝트의 경우 설정하는데 많은 리소스가 발생하므로 github actions가 좋습니다.

*반대로 규모가 클수록 GitHub Actions보다는 jenkins를 추천*

## githubActions

레포에서 빌드, 테스트, 패키지, 릴리즈 또는 배포하기 위해 설정할수 있는 커스텀 자동화 프로세스

- **트리거 발생 시 실행**
  - runs-on: 어느 플랫폼에서 실행시킬지 설정 (iOS인 경우 디폴트 값 **macos-latest**로 설정)
  - uses: 테스트를 하기 위해서 Repository의 코드 복사본을 만드는 코드
  - name: 실행할 작업의 이름
  - run: 스위프트 컴파일러로 빌드하는 명령어

temp script

```swift
name: Build and Test app

on:
  push:
    branches: [ develop ]
    tags: - v*

  pull_request:
    branches: [ develop ]
    tags: - v*

jobs:
  build:
    runs-on: macos-latest
    env:
      XC_VERSION: ${{ '13.1' }}
      XC_WORKSPACE: ${{ modooClass.xcworkspace }}
      XC_SCHEME: ${{ modooClass }}

    steps:
    - uses: actions/checkout@v2

    - name: Start xcode build 🛠
      run: |
        xcodebuild clean test -project "$XC_PROJECT" -scheme "$XC_SCHEME" -destination 'platform=iOS Simulator,name=iPhone 11 Pro,OS=14.5'

    - name: Export Archive 💾
      run: |
      xcodebuild -exportArchive \
      -archivePath DerivedData/Archive/modooClass.xcarchive \
      -exportOptionsPlist provisioning/App-Store.plist \
      -exportPath DerivedData/ipa

    - name: Deploy App to Apple 🍎
      run: |
      xcrun altool --upload-app --type ios \
      --file DerivedData/ipa/modooClass.ipa \
      --username "${{ secrets.appstore_connect_username }}" \
      --password "${{ secrets.appstore_connect_password }}" --verbose
```

### Steps

1. Checkout the code
2. Compile, archive and codesign it
3. Upload to Apple

[Github Actions으로 배포 자동화하기 : NHN Cloud Meetup](https://meetup.toast.com/posts/286)

githubAction

FastLine, Jenkins

XcodeServer

https://medium.com/@evertoncunha/tutorial-continuous-integration-with-xcode-9-and-fastlane-b0c5d605b233

https://semaphoreci.com/blog/tutorial-ios-cicd
