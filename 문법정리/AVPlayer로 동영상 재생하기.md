### [SWIFT\] 동영상 플레이어(AVPlayer)로 동영상 재생하기

1. 현재 뷰에서 addSubView

2. 모달 방식으로 띄우기

#### 1. Https통신을 위해 Info.plist 추가해주기

<img width="739" alt="스크린샷 2020-01-31 오전 10 54 35" src="https://user-images.githubusercontent.com/47776915/73506168-1f1b2d00-4418-11ea-9160-65b09cfb2c49.png">

```swift
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
```

##### AVKIt을 사용하면서 알게된 점

layer를 이용해서 바로 play 해주면  하단에 Controler가 나오지 않았다 그래서 찾아본 결과

AVPlayerViewController 이용해서 present해주면 컨트롤러가 정상적으로 나왔다 하지만 대부분의 코드들은 새로운 창을 띄워주는 코드가 대부분.

그냥 바로 controller에서 play해주고 싶어서 시도한 방법들

1. 그냥 ViewController에 addsubView → 까만화면만 나오고 동영상이 Play 되질않음
2. addChild하면 나오는데  상단에 ✖️표시가 없음 🤷🏻‍♀️
3. present로 하면  상단 닫기 버튼도 잘뜸!

https://kodaewon.github.io/ios/2018/11/05/ios-avplayerviewcontroller/

```swift
  let avUrl = URL(string: "https://s3.ap-northeast-2.amazonaws.com/fps3bucket/contents/2E3257C5E2954E51579767013.mp4")

 var player = AVPlayer()
 var playerLayer: AVPlayerLayer?
 var avController = AVPlayerViewController()

 player = AVPlayer(url: item!)
 playerLayer = AVPlayerLayer(player: player)
 playerLayer?.masksToBounds = true
 playerLayer?.contentsGravity = .resizeAspectFill  
 playerLayer?.frame = UIScreen.main.bounds

 self.layer.addSublayer(playerLayer!)
 player.play()
```

##### If you want to use *AVPlayerViewController*:

```swift
    let avUrl = URL(string: "https://s3.ap-northeast-2.amazonaws.com/fps3bucket/contents/2E3257C5E2954E51579767013.mp4")

    var player = AVPlayer()
    player = AVPlayer(url: avUrl!)


    var avController = AVPlayerViewController()
    avController.player = player

    self.present(avController, animated: true) {
        player.play()
    }
```

##### just *AVPlayer*

```swift
let videoURL = URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
let player = AVPlayer(url: videoURL!)
let playerLayer = AVPlayerLayer(player: player)
playerLayer.frame = self.view.bounds
self.view.layer.addSublayer(playerLayer)
player.play()
```

**1. AVKit**

AVKit프레임워크의 AVPlayerViewController를 사용하는게 가장 쉽고 편하다.

기본적인 비디오 컨트롤도 제공된다.

**2. AVPlayerLayer**

만약 재생화면을 커스터마이징 하고자 한다면, AVPlayerLayer를 사용하자.

CALayer의 서브클래스다. 비디오 컨트롤이 제공되지 않기 때문에 알아서 만들어야 한다.

https://stackoverflow.com/questions/25932570/how-to-play-video-with-avplayerviewcontroller-avkit-in-swift

https://baked-corn.tistory.com/118

#### loop AVPlayer

```swift
 NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: self.videoPlayer.currentItem, queue: .main) { [weak self] _ in
      self?.videoPlayer.seek(to: CMTime.zero)
      self?.videoPlayer.play()
    }
```

#### AVPlayer Height

```swift
//16 * 9 is the aspect ratio of all HDvideo
let height = UIScreen.main.bounds.width * 9 / 16
```





#### AVPlayer Background 재생

```swift
  // didFinishLaunchingWithOptions ???
  func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
  
    do {
      try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
      try AVAudioSession.sharedInstance().setActive(true)
    } catch {
      print(error)
    }
    return true
  }
```
