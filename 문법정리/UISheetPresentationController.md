# UISheetPresentationController

```swift
let contentsVC = ContentsVC() // UploadPostVC() //
        contentsVC.modalPresentationStyle = .pageSheet
        if #available(iOS 15.0, *) { // 15이상에서만 사용
          if let sheet = uploadPostVC.sheetPresentationController {
            sheet.detents = [.medium(), .large()] // 디폴트는 large
            sheet.largestUndimmedDetentIdentifier = .medium // 백터치X
            sheet.selectedDetentIdentifier = .large // 처음 띄울때 
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            // medium()만 하면 더이상 올라가지 않음
            sheet.preferredCornerRadius = 50
            sheet.prefersGrabberVisible = true
          }
        } else {
          // Fallback on earlier versions
        }
```



참고 [How to present a Bottom Sheet in iOS 15 with UISheetPresentationController | Sarunw](https://sarunw.com/posts/bottom-sheet-in-ios-15-with-uisheetpresentationcontroller/)


