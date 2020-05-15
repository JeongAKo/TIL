# UISlider

~~~swift
  private lazy var videoSilder: UISlider = {
    let slider = UISlider()
    slider.minimumTrackTintColor = UIColor.appColor(.pink_1000) //왼쪽 바 /컬러 조정 
    slider.maximumTrackTintColor = UIColor.appColor(.eeeeee) // 오른쪽 바 /남은만큼
    slider.setThumbImage(UIImage(named: "thumb"), for: .normal) //슬라이더 움직이는 포인터?
    controlsContainerView.addSubview(slider)
    return slider
  }()
~~~



