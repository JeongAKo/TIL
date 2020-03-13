### UIView

뷰에 그라데이션 효과를 주고 싶을 땐 `CAGradientLayer` 객체를 만들어서 뷰의 레이어 위에 올리면 된다.

~~~swift
// CAGradientLayouer를 생성
let gradient = CAGradientLayer()

// frame을 잡기
gradient.frame = view.bounds

// 섞어줄 색을 colors에 넣어준 뒤
gradient.colors = [UIColor.clear.cgColor, UIColor.clear.cgColor, UIColor.yellow.cgColor]

// 위치
gradient.locations = [0, 0.5, 1]

// layer에 붙이기
view.layer.addSublayer(gradient)
~~~

[참고](https://blog.b1ue.sh/ios-gradient/)

https://woongsios.tistory.com/5







## Shadow

~~~swift
let yourView = UIView()
yourView.layer.shadowColor = UIColor.black.cgColor
yourView.layer.shadowOpacity = 1
yourView.layer.shadowOffset = .zero
yourView.layer.shadowRadius = 10
~~~



https://www.hackingwithswift.com/example-code/uikit/how-to-add-a-shadow-to-a-uiview











