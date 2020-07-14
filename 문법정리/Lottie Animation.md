## Lottie Animation



~~~swift
    
    let animationView = AnimationView(name: "16895-carrot") 
    // AnimationView(name: "lottie json 파일 이름")으로 애니메이션 뷰 생성
    animationView.frame = CGRect(x: 0, y: 0, width: 100, height: 100) // 애니메이션뷰의 크기 설정
    animationView.center = self.view.center // 애니메이션뷰의 위치설정
    animationView.contentMode = .scaleAspectFill // 애니메이션뷰의 콘텐트모드 설정
    animationView.loopMode = .loop // 재생횟수
    view.addSubview(animationView) // 애니메이션뷰를 메인뷰에 추가
    
    animationView.play() // 애미메이션뷰 실행
  }

~~~



##### UIActivityIndicatorView

~~~swift
  private lazy var activityIndicator: UIActivityIndicatorView = {
    let activityIndicator = UIActivityIndicatorView()
    activityIndicator.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
    activityIndicator.center = self.view.center
    activityIndicator.hidesWhenStopped = true
    activityIndicator.style = UIActivityIndicatorView.Style.gray
    activityIndicator.startAnimating()
    return activityIndicator
  }()
~~~

