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





## Image Literal

~~~swift
  private lazy var imageView: UIImageView = {
    let imageview = UIImageView()
    imageview.contentMode = .scaleAspectFill
    imageView.image =  image Literal
    view.addSubview(imageview)
    return imageview
  }()
~~~

<img width="935" alt="스크린샷 2020-03-23 오후 4 44 53" src="https://user-images.githubusercontent.com/47776915/77293448-afddfd00-6d25-11ea-98dc-1b7520250d1a.png">





<img width="778" alt="스크린샷 2020-03-23 오후 4 46 48" src="https://user-images.githubusercontent.com/47776915/77293549-e6b41300-6d25-11ea-919e-0b97de60d0f9.png">



https://stackoverflow.com/questions/51397347/xcode-10-image-literals-no-longer-available







## 이미지 딱 맞게

~~~swift
class ScaledHeightImageView: UIImageView {

    override var intrinsicContentSize: CGSize {

        if let myImage = self.image {
            let myImageWidth = myImage.size.width
            let myImageHeight = myImage.size.height
            let myViewWidth = self.frame.size.width

            let ratio = myViewWidth/myImageWidth
            let scaledHeight = myImageHeight * ratio

            return CGSize(width: myViewWidth, height: scaledHeight)
        }

        return CGSize(width: -1.0, height: -1.0)
    }

}

~~~



### Add gesture

~~~
  lazy var imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFit
    imageView.clipsToBounds = true
    imageView.isUserInteractionEnabled = true
    imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tappedImgView(_:))))
    self.addSubview(imageView)
    return imageView
  }()
  
    // MARK: - ActionMethod
  @objc func tappedImgView(_ sender: UITapGestureRecognizer) {
    print("브랜드별 모아보기 이미지 클릭")
    notiCenter.post(name: .presentBrandPage, object: nil)
  }
  
~~~



#### ImageTintColor

~~~
  public lazy var emptyImageView: UIImageView = {
    let imageview = UIImageView()
    imageview.contentMode = .scaleAspectFit
    let image = UIImage(named: "packet")?.withRenderingMode(.alwaysTemplate)
    imageview.tintColor = UIColor.appColor(.gray_666)
    imageview.image = image
    self.addSubview(imageview)
    return imageview
  }()
~~~





#### 이미지뷰 중복 방지

~~~swift
extension UIImageView {
  
  func setImageView(with urlString: String) {
    
    image = nil // 이미지 중복 방지를 위해
    var imageUrlString: String = ""

    imageUrlString = urlString
    
    let cache = ImageCache.default
    cache.retrieveImage(forKey: urlString, options: [.transition(.fade(0.5))]) { (image, _) in // 캐시에서 키를 통해 이미지를 가져온다.
      if let image = image { // 만약 캐시에 이미지가 존재한다면
        DispatchQueue.main.async {
          self.image = image // 바로 이미지를 셋한다.
        }
      } else {
       if imageUrlString  == urlString { // 캐시가 없다면
        guard let url = URL(string: urlString) else {return}
          let resource = ImageResource(downloadURL: url , cacheKey: urlString) // URL로부터 이미지를 다운받고 String 타입의 URL을 캐시키로 지정하고
          //          self.kf.setImage(with: resource) // 이미지를 셋한다.
          DispatchQueue.main.async {
            self.kf.setImage(with: resource,
                             placeholder: nil,
                             options: [.transition(.fade(0.5)), .loadDiskFileSynchronously],
                             progressBlock: nil) { (_) in
            }
          }
        }
      }
    }
  }
}

~~~

