~~~swift

  // viewDidLayoutSubviews: Layout이 다 잡힌후에 호출되는 function
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()	 
  }


~~~





#### CornerRadius

- ##### 이슈

`Cell` 안에 `View`위에 객체를 올렸을때 `CornerRadius`가 먹질 않음

kakaoButton은 바로 cell에 addsubView를 했고

offLabel, offLabel은 backView에 addsubView를 했다

~~~swift
override func layoutSubviews() {
    super.layoutSubviews()
    kakaoButton.makeCorner(withRadius: kakaoButton.frame.size.height/2)
    lunchLabel.layoutIfNeeded() // cornerRadius가 안먹기 때문에 코드 추가 *순서중요!*
    offLabel.layoutIfNeeded() // cornerRadius가 안먹기 때문에 코드 추가 *순서중요!*
    lunchLabel.makeCorner(withRadius: lunchLabel.frame.size.height/2) 
    offLabel.makeCorner(withRadius: offLabel.frame.size.height/2)
  }
  
//슈퍼뷰의 사이즈를 가늠하기 어려울때는 UIscreen.main.bounse 를 쓰는게 좋다
~~~



~~~swift
// viewController안에 있을때

override func viewWillLayoutSubviews() {
  super.viewWillLayoutSubviews()
  congigureCornerRadius()
 }
   
   
private func congigureCornerRadius() {
  myButton.makeCorner(withRadius: myButton.frame.width/2) //동그랗게
 }

~~~





### Margin VS Padding

<img width="466" alt="스크린샷 2020-04-23 오후 4 43 05" src="https://user-images.githubusercontent.com/47776915/80072793-b4464180-8581-11ea-97a9-1927501e1ab0.png">

Margin과 Padding 두가지 속성의 차이점은 위 사진 하나로 충분히 설명이 가능하다. 

Margin은 Object와 화면과의 여백(외부여백)을 말하며 Padding은 Object내의 내부여백을 의미.







### Layout 위치

~~~swift
//
self.view.bringSubviewToFront(self.orangeView)
~~~

https://zeddios.tistory.com/832