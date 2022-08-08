## swift pakage manager

1. General > Framework > **+** 버튼

![스크린샷 2022-01-17 오전 10.34.24.png](/Users/daisy/Desktop/스크린샷%202022-01-17%20오전%2010.34.24.png)

2. Add Package Dependency

![스크린샷 2022-01-17 오전 10.36.54.png](/var/folders/bh/lsgcmpkd3dg14y7gdlypkx600000gn/T/TemporaryItems/NSIRD_screencaptureui_suyqIg/스크린샷%202022-01-17%20오전%2010.36.54.png)

3. 사용할 라이브러리 주소 입력

![스크린샷 2022-01-17 오전 10.39.11.png](/var/folders/bh/lsgcmpkd3dg14y7gdlypkx600000gn/T/TemporaryItems/NSIRD_screencaptureui_7pkIjE/스크린샷%202022-01-17%20오전%2010.39.11.png)

4. 라이브러리의 사용할 버전, 브랜치 또는 커밋을 선택합니다.

5. 라이브러리의 사용할 모듈을 선택합니다.





##### SPM Repository Error

```
Quit Xcode
rm -rf ~/Libray/Developer/Xcode/DerivedData
rm -rf ~/Library/Caches/org.swift.swiftpm
Start Xcode
File->Packages->Reset Package Caches
Build (could take a while depending on how many packages you have)
```