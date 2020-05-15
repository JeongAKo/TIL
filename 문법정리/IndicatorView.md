# IndicatorView

~~~swift
 private lazy var activityIndicatorView: UIActivityIndicatorView = {
    let aiv = UIActivityIndicatorView(style: .whiteLarge)
    aiv.translatesAutoresizingMaskIntoConstraints = false
    aiv.stopAnimating() //aiv.stopAnimating()
    controlsContainerView.addSubview(aiv)
    return aiv
  }()
~~~

