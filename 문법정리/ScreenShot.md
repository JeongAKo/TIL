### ScreenShot



~~~swift
  @objc private func tappedCaptureButton(_ sender: UIButton) {
    print("화면캡쳐")
    
    screenShotMethod()
    ToastView.shared.bottomToast(self.view, txt_msg: "캡쳐성공")
  }

func screenShotMethod() {

  guard let layer = UIApplication.shared.keyWindow?.layer else { return }

  UIGraphicsBeginImageContextWithOptions(layer.frame.size, true, 0)

  guard let context = UIGraphicsGetCurrentContext() else { return }

  layer.render(in: context)

  guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return }

  UIGraphicsEndImageContext()

   

  //Save it to the camera roll

  UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)

 }
~~~



##### `Plist` 설정

Privacy - Photo Library Usage Description - 사진앨범에 접근하도록 허용버튼을 눌러주세요.

Privacy - Photo Library Additions Usage Description - 사진첩에 사진을 추가합니다.

Privacy - Camera Usage Description - 카메라 접근 허용

