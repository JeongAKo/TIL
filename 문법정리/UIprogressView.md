## UIpogressView()

~~~swift
  private lazy var progressBar: UIProgressView = {
  let progress = UIProgressView(progressViewStyle: .bar)  //defualt 는 배경이 컴컴함
    progress.progressTintColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    progress.backgroundColor = .clear
    view.addSubview(progress)
    return progress
  }()	
  
~~~

