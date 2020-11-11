SwipeBestVC

~~~
  fileprivate func configureTabbar() {
//    let bar = TMBar.ButtonBar()
    bar.layout.transitionStyle = .snap // Customize
    bar.layout.contentInset = UIEdgeInsets(top: 12.0, left: 20.0, bottom: 12.0, right: 20.0)
    bar.spacing = 36
    bar.layout.alignment = .leading
    bar.backgroundView.style = .blur(style: .light)
    bar.backgroundColor = .white
    bar.tintColor = UIColor.black
    bar.backgroundView.tintColor = .white
    bar.buttons.customize { button in
      button.tintColor = UIColor.appColor(.brownishGrey)
      button.selectedTintColor = UIColor.appColor(.white_255)
      button.layer.borderColor = UIColor.appColor(.gray650).cgColor
      button.layer.borderWidth = 1
      button.makeCorner(withRadius: 5)
      button.font = UIFont.NanumRegular(size: 13)
      button.backColor = UIColor.white //
      button.selectedBackColor = UIColor.appColor(.pink_1000) //
      button.selectedFont = UIFont.NanumBold(size: 13)
      button.contentInset = UIEdgeInsets(top: 8, left: 13, bottom: 8, right: 13)
    }
    
    bar.indicator.isHidden = true
    addBar(bar, dataSource: self, at: .top)
  }
~~~



TMBarBackgroundView

~~~
  
    // ycg 40~44
//    @available(*, unavailable)
//    open override var backgroundColor: UIColor? {
//        didSet {
//        }
//    }
~~~



TMLabelBarButton

~~~
//88~90
  open var backColor: UIColor!
  
  open var selectedBackColor: UIColor!

// ycg 223~230
        if isSelected {
            backgroundView.backgroundColor = selectedBackColor
        } else {
            backgroundView.backgroundColor = backColor
        }
        //
        print("zz color: \(badgeContainer.backgroundColor)")
~~~

