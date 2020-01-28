## StatusBar



~~~swift
  func animateStatusBar() {
    UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
      self.setNeedsStatusBarAppearanceUpdate()
    }, completion: nil)
  }
~~~



~~~swift
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .default
  }
~~~

