#### ImageView

~~~swift
  lazy var notiImageView: UIImageView = {
    let notiImg = UIImageView()
    notiImg.image = UIImage(named: "0130_store_popup")
    notiImg.isUserInteractionEnabled = true
    notiImg.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tappedImgView(_:))))
    view.addSubview(notiImg)
    return notiImg
  }()
  

  // MARK: - ActionMethod
  @objc func tappedImgView(_ sender: UITapGestureRecognizer) {
    print("이미지 클릭")
    guard let url = URL(string: "https://fleapop.co.kr/re/fleapop/home"),
    UIApplication.shared.canOpenURL(url) else { return }
    UIApplication.shared.open(url, options: [:], completionHandler: nil)
  }
  
~~~



~~~swift
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

~~~

