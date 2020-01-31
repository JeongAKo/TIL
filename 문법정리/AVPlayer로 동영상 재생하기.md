### [SWIFT\] 동영상 플레이어(AVPlayer)로 동영상 재생하기



1. 현재 뷰에서 addSubView

2. 모달 방식으로 띄우기



#### 1. Https통신을 위해 Info.plist 추가해주기

<img width="739" alt="스크린샷 2020-01-31 오전 10 54 35" src="https://user-images.githubusercontent.com/47776915/73506168-1f1b2d00-4418-11ea-9160-65b09cfb2c49.png">



~~~swift

import UIKit
import AVKit


class AVPlayerTestVC: UIViewController, AVPlayerViewControllerDelegate {
  
  let avUrl = URL(string: "https://s3.ap-northeast-2.amazonaws.com/fps3bucket/contents/2E3257C5E2954E51579767013.mp4")
  var avPlayer = AVPlayer()
  var avController = AVPlayerViewController()
  
  private lazy var avPlayButton: UIButton = {
    let button = UIButton()
    button.addTarget(self, action: #selector(btnClicked(_:)), for: .touchUpInside)
    button.backgroundColor = .yellow
    view.addSubview(button)
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    avPlayButton.snp.makeConstraints { make in
      make.center.equalToSuperview()
      make.width.height.equalTo(50)
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  
  override var shouldAutorotate: Bool {
    return true
  }
  
  
  @objc func btnClicked(_ sender: UIButton) {
    avPlayer = AVPlayer(url: avUrl!)
    avController.player = avPlayer
    avController.view.frame = self.view.frame
    avController.player?.isMuted = true // Mute
    avController.showsPlaybackControls = false //playController (pause...etc)
    self.present(avController, animated: true, completion: nil)
    avPlayer.play()
  }
}

~~~

