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
  
~~~

