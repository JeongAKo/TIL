### How to round only specific corners to a UIView in iOS using Swift



![스크린샷 2019-09-05 오후 12 12 58](https://user-images.githubusercontent.com/47776915/64309140-8f8f6080-cfd6-11e9-862c-4c30187bf7c2.png)



```swift
if #available(iOS 11.0, *){
  myUIView.clipsToBounds = true
  myUIView.layer.cornerRadius = 5
  myUIView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
}else{
  let path = UIBezierPath(roundedRect: myUIView.bounds,byRoundingCorners:[.topLeft, .topRight],cornerRadii: CGSize(width: 5, height:  5))
  let maskLayer = CAShapeLayer()
  maskLayer.path = path.cgPath
  myUIView.layer.mask = maskLayer
}
```



As you see, for devices with **iOS 10** **and below**, we use `UIBezierPath` to draw the path on our `UIView`.

For the **iOS 11** **and above**, we use `maskedCorners` in array. 
Here’s the list of the corners:

`.layerMinXMinYCorner` = Top Left Corner
`.layerMaxXMinYCorner` = Top Right Corner
`.layerMinXMaxYCorner` = Bottom Left Corner
`.layerMaxXMaxYCorder` = Bottom Right Corner



[참조](https://johncodeos.com/how-to-round-only-specific-corners-to-a-uiview-in-ios-using-swift/)